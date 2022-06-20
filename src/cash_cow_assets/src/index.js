import {cash_cow} from "../../declarations/cash_cow";


window.addEventListener("load", async function() {
  // console.log("Finished loading cash cows");
  const currentAmount = await cash_cow.checkBalance();
  // 2 decimal place accuracy
  document.getElementById("value").innerText = Math.round(currentAmount*100) /100;

});

document.querySelector("form").addEventListener("submit", async function(event) {
  event.preventDefault();
  // console.log("submitted.";)

  const button = event.target.querySelector("#submit-btn")
  const inputAmount = parseFloat(document.getElementById("input-amount").value);
  const outputAmount = parseFloat(document.getElementById("withdrawal-amount").value);

  button.setAttribute("disabled");

  if (document.getElementById("input-amount").value.length != 0){
      await cash_cow.topUp(inputAmount);
  }

  if (document.getElementById("withdrawal-amount")).value.length != 0) {
      await cash_cow.withdrawal(outputAmount);
  }

  await cash_cow.compound();

  
  const currentAmount = await cash_cow.checkBalance();
  // 2 decimal place accuracy
  document.getElementById("value").innerText = Math.round(currentAmount*100) /100;

  document.getElementByID("input-amount").value = "";
  document.getElementByID("withdrawal-amount").value = "";

  button.removeAttribute("disabled");
