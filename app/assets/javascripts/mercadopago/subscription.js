window.Mercadopago.setPublishableKey("APP_USR-94728077-2644-4d83-b383-5a10ae527dbb");

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
        /*
          Código	Descrição	Mensagem sugerida
          205	parameter cardNumber can not be null/empty	Digite o número do seu cartão.
          208	parameter cardExpirationMonth can not be null/empty	Escolha um mês.
          209	parameter cardExpirationYear can not be null/empty	Escolha um ano.
          212	parameter docType can not be null/empty	Informe seu documento.
          213	The parameter cardholder.document.subtype can not be null or empty	Informe seu documento.
          214	parameter docNumber can not be null/empty	Informe seu documento.
          220	parameter cardIssuerId can not be null/empty	Informe seu banco emissor.
          221	parameter cardholderName can not be null/empty	Digite o nome e sobrenome.
          224	parameter securityCode can not be null/empty	Digite o código de segurança.
          E301	invalid parameter cardNumber	Há algo de errado com esse número. Digite novamente.
          E302	invalid parameter securityCode	Confira o código de segurança.
          316	invalid parameter cardholderName	Por favor, digite um nome válido.
          322	invalid parameter docType	Confira seu documento.
          323	invalid parameter cardholder.document.subtype	Confira seu documento.
          324	invalid parameter docNumber	Confira seu documento.
          325	invalid parameter cardExpirationMonth	Confira a data.
          326	invalid parameter cardExpirationYear	Confira a data.
          default	Outro código de erro	Confira os dados.
        */
        for (const error of response.cause) {
          console.log(error)
          if (error.code == 205) {
            setError('#card_number', 'Digite o número do seu cartão.')
          }

          else if (error.code == 208) {
            setError('#card_expiration_month', 'Escolha um mês.')
          }


          else if (error.code == 209) {
            setError('#card_expiration_year', 'Escolha um ano.')
          }

          else if (error.code == 212) {
            showAlert('Seu CPF está em branco.<br>Acesse seu <a href="/users/edit">perfil</a> e corrija.')
            // parameter docType can not be null/empty	Informe seu documento.
          }

          else if (error.code == 213) {
            showAlert('Seu CPF está em branco.<br>Acesse seu <a href="/users/edit">perfil</a> e corrija.')
            // The parameter cardholder.document.subtype can not be null or empty	Informe seu documento.
          }

          else if (error.code == 214) {
            showAlert('Seu CPF está em branco.<br>Acesse seu <a href="/users/edit">perfil</a> e corrija.')
            //  docNumber can not be null/empty	Informe seu documento.
          }

          else if (error.code == 220) {
            showAlert('O Emissor do cartão não pôde ser definido.\nConfira os dados.')
            // cardIssuerId can not be null/empty	Informe seu banco emissor.
          }

          else if (error.code == 221) {
            setError('#cardholder_name', 'Digite o nome e sobrenome.')
          }

          else if (error.code == 224) {
            setError('#security_code', 'Digite o código de segurança.')
          }

          else if (error.code == 'E301') {
            setError('#card_number', 'Há algo de errado com esse número. Digite novamente.')
          }

          else if (error.code == 'E302') {
            setError('#security_code', 'Confira o código de segurança.')
          }

          else if (error.code == 316) {
            setError('#cardholder_name', 'Por favor, digite um nome válido.')
          }

          else if (error.code == 322) {
            showAlert('Seu CPF é inválido.<br>Acesse seu <a href="/users/edit">perfil</a> e corrija.')
            // invalid parameter docType	Confira seu documento.
          }

          else if (error.code == 323) {
            showAlert('Seu CPF é inválido.<br>Acesse seu <a href="/users/edit">perfil</a> e corrija.')
            // invalid parameter cardholder.document.subtype	Confira seu documento.
          }

          else if (error.code == 324) {
            showAlert('Seu CPF é inválido.<br>Acesse seu <a href="/users/edit">perfil</a> e corrija.')
            // invalid parameter docNumber	Confira seu documento.
          }

          else if (error.code == 325) {
            setError('#card_expiration_month', 'Confira a data.')
          }

          else if (error.code == 326) {
            setError('#card_expiration_year', 'Confira a data.')
          }

          else {
            showAlert('Ocorreu um erro inesperado.<br>Tente novamente.')
          }
        }
      }
    })

    return false
  }
})
