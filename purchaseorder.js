var pono, supp, pdate

function check()
{
	pono = document.po.pono.value
	supp = document.po.supp.options[document.po.supp.selectedIndex].text
	pdate = document.po.pdate.value
	if(pono==""||supp==""||pdate=="")
	{
		alert("Please fill in all the fields!")
		document.po.pono.focus()
		return false
	}
	else
		return true
}
function addClicked()
{
	if(check())
	{
		document.po.action="newpo.jsp"
		document.po.target="_self"
		return true
	}
	else
		return false
}
function poSelected()
{
	if(document.po.selpo.options[document.po.selpo.selectedIndex].text=="")
	{
		document.po.addpo.disabled = false
		document.po.mod.disabled = true
		document.po.del.disabled = true
		document.po.pono.disabled = false
		document.po.supp.disabled = false
		document.po.pdate.disabled = false
		document.po.pono.focus()
	}
	else
	{
		document.po.addpo.disabled = true
		document.po.mod.disabled = false
		document.po.del.disabled = false
		document.po.pono.disabled = true
		document.po.supp.disabled = true
		document.po.pdate.disabled = true
	}
}
function checkpono()
{
	pono = document.po.pono.value
	//alert(document.po.selpo.selectedIndex)
	for(var i=1;i<=document.po.selpo.length-1;i++)
	{
		if(pono.match(document.po.selpo.options[document.po.selpo.selectedIndex+i].text))
		{
			document.po.pono.value=""
			//document.po.pono.focus()
			/*this can't be used as when you click on OK of the
			alert box, pono loses focus and checkpono() gets
			called again and again repeatedly*/
			alert("Duplicate P.O. Number!")
			break
		}
	}
}
function delClicked()
{
	var s = confirm("Are you sure you want to delete this particular Purchase Order?")
	if(s==true)
	{
		document.po.hiddenpono.value=document.po.selpo.options[document.po.selpo.selectedIndex].text
		document.po.action="delpo.jsp"
		document.po.target="_self"
	}
}
function modClicked()
{
	document.po.hiddenpono.value=document.po.selpo.options[document.po.selpo.selectedIndex].text
	document.po.action="modpo.jsp"
	document.po.target="_self"
}
