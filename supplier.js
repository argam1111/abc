var id, name, addr, tel, vat, tin
function focusfirst()
{
	document.supp.sid.focus()
}
function addsupp()
{
	id = document.supp.sid.value
	name = document.supp.sname.value
	addr = document.supp.saddr.value
	tel = document.supp.sph.value
	vat = document.supp.vat.value
	tin = document.supp.tin.value
	if(id==""||name==""||addr==""||tel==""||vat==""||tin=="")
	{
		alert("Please fill in all the fields!")
		return false
	}
	for(var i=0;i<tel.length;i++)
	{
		if((tel.charCodeAt(i)>64&&tel.charCodeAt(i)<91)||(tel.charCodeAt(i)>96&&tel.charCodeAt(i)<123)||(tel.charCodeAt(i)==45)||(tel.charCodeAt(i)==46)||(tel.charCodeAt(i)==95)||(tel.charCodeAt(i)==""))
		{
			alert("Tel no. must be numeric!")
			return false
		}
	}
	for(var i=0;i<vat.length;i++)
	{
		if((vat.charCodeAt(i)>64&&vat.charCodeAt(i)<91)||(vat.charCodeAt(i)>96&&vat.charCodeAt(i)<123)||(vat.charCodeAt(i)==45)||(vat.charCodeAt(i)==46)||(vat.charCodeAt(i)==95)||(vat.charCodeAt(i)==""))
		{
			alert("VAT must be numeric!")
			return false
		}
	}
	for(var i=0;i<tin.length;i++)
	{
		if((tin.charCodeAt(i)>64&&tin.charCodeAt(i)<91)||(tin.charCodeAt(i)>96&&tin.charCodeAt(i)<123)||(tin.charCodeAt(i)==45)||(tin.charCodeAt(i)==46)||(tin.charCodeAt(i)==95)||(tin.charCodeAt(i)==""))
		{
			alert("TIN must be numeric!")
			return false
		}
	}
	return true
}
function modsupp()
{
	document.supp.action="modsupp.jsp"
	document.supp.target="_self"
}
function delsupp()
{
	document.supp.action="delsupp.jsp"
	document.supp.target="_self"
}
function suppSelected()
{
	if(document.supp.suppid.options[document.supp.suppid.selectedIndex].text == "")
	{
		document.supp.del.disabled = true
		document.supp.mod.disabled = true
		document.supp.add.disabled = false
		document.supp.sid.disabled = false
		document.supp.sname.disabled = false
		document.supp.saddr.disabled = false
		document.supp.sph.disabled = false
		document.supp.vat.disabled = false
		document.supp.tin.disabled = false
	}
	else
	{
		document.supp.del.disabled = false
		document.supp.mod.disabled = false
		document.supp.add.disabled = true
		document.supp.sid.disabled = true
		document.supp.sname.disabled = true
		document.supp.saddr.disabled = true
		document.supp.sph.disabled = true
		document.supp.vat.disabled = true
		document.supp.tin.disabled = true
	}
}
