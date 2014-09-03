$ ->
  currentCharge = $(".card").attr("data-currentCharge")

  updateCssCard = (x) ->
    for i in [8...x]
      $("#coffee#{i}").css("opacity","0.2")
  updateHtmlIndex = (x) ->
    $("td.tdForCharge#{x}").text("Next time you meet this customer, you will recharge him with a free coffe!")
    $("p.textForCharge#{x}").text("It is time to recharge this customer with a free coffee!")
    $("input.inputForCharge#{x}").attr("value", "confirm that you have offered a free coffee")

  updateCssCard(currentCharge)
  updateHtmlIndex(8)
