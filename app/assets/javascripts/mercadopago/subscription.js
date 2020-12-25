window.Mercadopago.setPublishableKey("APP_USR-94728077-2644-4d83-b383-5a10ae527dbb");

$(document).on('turbolinks:load', function () {
  const sendTokenButton = document.getElementById('send_token')

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
      if (status == 200 || status == 201) {
        const token = document.getElementById('token')
        token.setAttribute('value', response.id)
        form.submit()
      } else {
        alert('Incorrect data')
      }
    })

    return false
  }
});
