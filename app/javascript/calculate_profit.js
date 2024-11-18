document.addEventListener('DOMContentLoaded', () => {
  const priceInput = document.getElementById('item-price');
  const taxDisplay = document.getElementById('add-tax-price');
  const profitDisplay = document.getElementById('profit');

  console.log('priceInput:', priceInput);
  console.log('taxDisplay:', taxDisplay);
  console.log('profitDisplay:', profitDisplay);
  
  if (priceInput) {
    priceInput.addEventListener('input', () => {
      const price = parseInt(priceInput.value, 10);

      if (!isNaN(price) && price >= 300 && price <= 9999999) {
        const tax = Math.floor(price * 0.1);
        const profit = Math.floor(price - tax);

        taxDisplay.textContent = tax;
        profitDisplay.textContent = profit;
      } else {
        taxDisplay.textContent = '';
        profitDisplay.textContent = '';
      }
    });
  }
});