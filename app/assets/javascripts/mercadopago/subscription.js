const known_errors = {
  '10000': 'Bandeira de cartão de crédito inválida',
  '10001': 'Número do cartão de crédito com comprimento inválido',
  '10002': 'Formato de data inválido',
  '10003': 'Campo de segurança inválido',
  '10004': 'cvv é obrigatório',
  '10006': 'campo de segurança com comprimento inválido',
}

function sliceToMaxLength() {
  if (this.value.length > this.maxLength) {
    this.value = this.value.slice(0, this.maxLength)
  }
}

function closeAlert() {
  $('.alert').hide()
}

function showAlert(message) {
  const container = $('#alert-container')
  container.html('')

  container.append(`
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
      ${message}
    </div>
  `)

  setTimeout(() => {
    $('.alert').alert('close')
  }, 3000)
}

function setError(fieldQuery, errorMessage) {
  const field = $(fieldQuery)
  field.addClass('is-invalid')
  // field.siblings('div.invalid-feedback')[0].innerText += (errorMessage + '\n')
  field.siblings('div.invalid-feedback')[0].innerText = errorMessage
}

function clearErrors() {
  const form = document.getElementById('card-data-form')

  const fields = Array.from(form.elements)

  for (const field of fields) {
    field.classList.remove('is-invalid')
  }
}

$(() => {
  $('input[type="number"][maxlength]').on('input', sliceToMaxLength)

  const sendTokenButton = document.getElementById('send_token')

  if (document.querySelector('.card-wrapper')){
    const card = new Card({
      form: '#card-data-form',
      container: '.card-wrapper',

      placeholders: {
        number: '**** **** **** ****',
        name: 'Nome Sobrenome',
        expiry: '**/****',
        cvc: '***'
      },

      formSelectors: {
        numberInput: '#card_number',
        expiryInput: '#card_expiration_month, #card_expiration_year',
        cvcInput: '#security_code',
        nameInput: '#cardholder_name'
      },

      debug: false
    })
  }

  if (sendTokenButton) {
    sendTokenButton.addEventListener('click', createTokenAndSubmit)
  }

  const setValue = (id, value) => document.querySelector(id).value = value
  const setAttr = (id, attr, value) => document.querySelector(id)[attr] = value

  PagSeguroDirectPayment.setSessionId(gon.session.id);

  PagSeguroDirectPayment.onSenderHashReady(function(response) { window.senderHash = response.senderHash; })

  PagSeguroDirectPayment.onSenderHashReady(function(response) {
    if (response.status == 'error') {
      return false;
    }

    setValue('#sender_hash', response.senderHash)
  });

  $("#card_number").on('keyup', function() {
    if ($("#card_number").val().length >= 7) {
      PagSeguroDirectPayment.getBrand({
        cardBin: $("#card_number").val().replace(/\s/g, '').substring(0, 6),
        success: function(response) {
          $("#card_brand").val(response['brand']['name']);
          $("#security_code").attr('size', response['brand']['cvvSize']);
        },
        error: function(response) {
        }
      })
    };
  })

  function createTokenAndSubmit(event) {
    const form = document.getElementById('subscription_form')
    const value = (id) => document.getElementById(id).value

    var payload = {
      cardNumber: value('card_number'),
      expirationMonth: value('card_expiration_month'),
      expirationYear: value('card_expiration_year'),
      cvv: value('security_code'),
      success: function(response) {
        const token = document.getElementById('token')
        token.setAttribute('value', response['card']['token'])
        form.submit()
      },
      error: function(response) {
        error_keys = Object.keys(response.errors)
        errors = error_keys.map((key) => known_errors[key] !== undefined ? known_errors[key] : '')
        message = errors.join(', ')
        showAlert(message);
      }
    }

    if ($("#card_brand").val() != '') {
      payload.brand = $("#card_brand").val()
    }

    PagSeguroDirectPayment.createCardToken(payload)

    return false
  }
})
