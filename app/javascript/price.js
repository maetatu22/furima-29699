function price(){
  const price_item = document.getElementById("item-price");
  const sales_commission = document.getElementById("add-tax-price");
  const sales_profit = document.getElementById("profit");
   if(price_item != null) {
    price_item.addEventListener('keyup', () => {
        const value = price_item.value;

      if(value >= 300 && value <= 9999999){
        let fee = parseInt( value * 0.1 )
        let profit = value - fee
        sales_commission.innerHTML = fee.toLocaleString();
        sales_profit.innerHTML = profit.toLocaleString();
      } else {
        let fee = '-'
        let profit = '-'
        sales_commission.innerHTML = fee;
        sales_profit.innerHTML = profit;
      }
    })};
}
window.addEventListener('load', price);