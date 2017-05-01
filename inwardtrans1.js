var qty, date, imno, immax, imstock

function check()
{
	imno = document.inwdtrans.imno.value
	qty = document.inwdtrans.itqty.value
	date = document.inwdtrans.itdate.value
	immax = parseInt(document.inwdtrans.immax.value)
	imstock = parseInt(document.inwdtrans.imstock.value)
	if(qty==""||date=="")
	{
		alert("Please fill in the details!")
		document.inwdtrans.itqty.select()
		document.inwdtrans.itqty.focus()
		return false
	}
	for(var i=0;i<qty.length;i++)
	{
		if((qty.charCodeAt(i)>64&&qty.charCodeAt(i)<91)||(qty.charCodeAt(i)>96&&qty.charCodeAt(i)<123)||(qty.charCodeAt(i)==45)||(qty.charCodeAt(i)==46)||(qty.charCodeAt(i)==95)||(qty.charCodeAt(i)==""))
		{
			alert("Quantity must be numeric!")
			document.inwdtrans.itqty.select()
			document.inwdtrans.itqty.focus()
			return false
		}
	}
	qty = parseInt(document.inwdtrans.itqty.value)
	if((qty+imstock)>immax)
	{
		alert("Stock + Quantity exceeds the Maximum Level!")
		document.inwdtrans.itqty.select()
		document.inwdtrans.itqty.focus()
		return false
	}
	document.inwdtrans.htid.value = date+"_"+imno
	return true
}
function addClicked()
{
	if(check())
	{
		document.inwdtrans.action="addintrans.jsp"
		document.inwdtrans.target="_self"
		return true
	}
	else
		return false
}
