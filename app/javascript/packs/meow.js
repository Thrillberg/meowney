document.addEventListener("turbolinks:load", function() {
  var meowText = document.getElementById("meow_text")
  meowText.addEventListener("input", onTextChange)
});

var onTextChange = (event) => {
  var totalCost = event.target.value.length
  document.getElementById("meow_cost").value = totalCost

  var costElement = document.getElementById("cost") || document.createElement("p")
  costElement.id = "cost"
  costElement.innerHTML = "$" + totalCost
  document.getElementsByClassName("container")[0].appendChild(costElement)
}
