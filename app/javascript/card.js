const pay = () => {
  const publicKey = gon.public_key;
  const payjp = Payjp(publicKey);
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  const form = document.getElementById('charge-form');
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const errorElement = document.getElementById('card-errors');
    errorElement.textContent = '';

    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
        errorElement.textContent = response.error.message;
        console.error('Error creating token: ', response.error.message);
        form.submit();
      } else {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        document.getElementById('button').setAttribute('disabled', 'true');

        numberElement.clear();
        expiryElement.clear();
        cvcElement.clear();

        form.submit();
      }
    }).catch(function (error) {
      console.error('Unexpected error: ', error);
      form.submit();
    });
  });
};

window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);