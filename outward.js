var mstock, mdate, mqty, mjob, min, ro, mno

function check()
{
	mdate = document.outwd.odate.value
	mqty = document.outwd.oqty.value
	mjob = document.outwd.ojob.value
	if(mdate==""||mqty==""||mjob=="")
	{
		alert("Please fill in all the details!")
		document.outwd.oqty.select()
		document.outwd.oqty.focus()
		return false
	}
	for(var i=0;i<mqty.length;i++)
	{
		if((mqty.charCodeAt(i)>64&&mqty.charCodeAt(i)<91)||(mqty.charCodeAt(i)>96&&mqty.charCodeAt(i)<123)||(mqty.charCodeAt(i)==45)||(mqty.charCodeAt(i)==46)||(mqty.charCodeAt(i)==95)||(mqty.charCodeAt(i)==""))
		{
			alert("Quantity must be numeric!")
			document.outwd.oqty.select()
			document.outwd.oqty.focus()
			return false
		}
	}
	mstock = parseInt(document.outwd.mstock.value)
	mqty =  parseInt(document.outwd.oqty.value)
	min = parseInt(document.outwd.min.value)
	if((mstock-mqty)<min)
	{
		alert("Cannot outward this quantity as stock goes below minimum level")
		document.outwd.oqty.select()
		document.outwd.oqty.focus()
		return false
	}
	ro = parseInt(document.outwd.hro.value)
	mno = document.outwd.omno.value
	if((mstock-mqty)<=ro)
	{
		alert("Stock level of "+mno+" has reached reorder level.\nPlease place an order for the material.")
	}
	var s = mdate+"_"+mno
	document.outwd.htid.value = s
	return true
}

function addClicked()
{
	if(check())
	{
		document.outwd.action="addouttrans.jsp"
		document.outwd.target="_self"
		return true
	}
	else
		return false
}
/*function outSelected()
{
	if(document.outwd.omname.options[document.outwd.omname.selectedIndex].text=="")
	{
		document.outwd.add.disabled = false
		document.outwd.mod.disabled = true
		document.outwd.del.disabled = true
		document.outwd.omno.value = ""
		document.outwd.odate.value = ""
		document.outwd.omqty.value = ""
		document.outwd.omjob.value = ""
		document.outwd.omno.focus()
	}
	else
	{
		document.outwd.add.disabled = true
		document.outwd.mod.disabled = false
		document.outwd.del.disabled = false
		document.outwd.omno.focus()
	}
}*/
