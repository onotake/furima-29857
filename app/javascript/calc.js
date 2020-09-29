function calc() {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener('keyup',() => {
    const salesCommission = (itemPrice.value) * 0.1;
    const salesProfit = (itemPrice.value) - salesCommission;
    const addTaxPrice = document.getElementById('add-tax-price');
    const profit = document.getElementById('profit');
    addTaxPrice.innerHTML = `${salesCommission}`;
    profit.innerHTML = `${salesProfit}`;
  })
};

addEventListener('load', calc);