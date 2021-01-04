window.Mercadopago.setPublishableKey("APP_USR-94728077-2644-4d83-b383-5a10ae527dbb");

const responses = {
  '205': {
    field: '#card_number',
    message: 'Digite o número do seu cartão.',
  },
  '208': {
    field: '#card_expiration_month',
    message: 'Escolha um mês.',
  },
  '209': {
    field: '#card_expiration_year',
    message: 'Escolha um ano.',
  },
  '212': {
    message: 'Seu CPF está em branco.<br>Acesse seu <a href="/users/edit">perfil</a> e corrija.',
  },
  '213': {
    message: 'Seu CPF está em branco.<br>Acesse seu <a href="/users/edit">perfil</a> e corrija.',
  },
  '214': {
    message: 'Seu CPF está em branco.<br>Acesse seu <a href="/users/edit">perfil</a> e corrija.',
  },
  '220': {
    message: 'O Emissor do cartão não pôde ser definido.\nConfira os dados.',
  },
  '221': {
    field: '#cardholder_name',
    message: 'Digite o nome e sobrenome.',
  },
  '224': {
    field: '#security_code',
    message: 'Digite o código de segurança.',
  },
  'E301': {
    field: '#card_number',
    message: 'Há algo de errado com esse número. Digite novamente.',
  },
  'E302': {
    field: '#security_code',
    message: 'Confira o código de segurança.',
  },
  '316': {
    field: '#cardholder_name',
    message: 'Por favor, digite um nome válido.',
  },
  '322': {
    message: 'Seu CPF é inválido.<br>Acesse seu <a href="/users/edit">perfil</a> e corrija.',
  },
  '323': {
    message: 'Seu CPF é inválido.<br>Acesse seu <a href="/users/edit">perfil</a> e corrija.',
  },
  '324': {
    message: 'Seu CPF é inválido.<br>Acesse seu <a href="/users/edit">perfil</a> e corrija.',
  },
  '325': {
    field: '#card_expiration_month',
    message: 'Confira a data.',
  },
  '326': {
    field: '#card_expiration_year',
    message: 'Confira a data.',
  },
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
  const _alert = $('.alert')
  _alert.find('.alert-content')[0].innerHTML = message
  _alert.show()
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

$(document).on('turbolinks:load', function () {
  $('input[type="number"][maxlength]').on('input', sliceToMaxLength)

  const sendTokenButton = document.getElementById('send_token')

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

  if (sendTokenButton) {
    sendTokenButton.addEventListener('click', createTokenAndSubmit)
  }

  function createTokenAndSubmit(event) {
    const form = document.getElementById('subscription_form')
    const value = (id) => document.getElementById(id).value

    const payload = {
      'cardholderName': value('cardholder_name'),
      'cardNumber': value('card_number'),
      'cardExpirationMonth': value('card_expiration_month'),
      'cardExpirationYear': value('card_expiration_year'),
      'securityCode': value('security_code'),
      'docType': value('doc_type'),
      'docNumber': value('doc_number'),
    }

    window.Mercadopago.createToken(payload, (status, response) => {
      clearErrors()

      if (status == 200 || status == 201) {
        const token = document.getElementById('token')
        token.setAttribute('value', response.id)
        form.submit()
      }
      else {
        for (const error of response.cause) {
          const code = error.code.toString()

          const responseData = responses[code]

          if (!responseData) {
            showAlert('Ocorreu um erro inesperado.<br>Tente novamente.')
            return
          }

          if (responseData.field) {
            setError(responseData.field, responseData.message)
          }
          else {
            showAlert(responseData.message)
          }
        }
      }
    })

    return false
  }
})
