var no, des, qty
function focusfirst()
{
	document.mat.mno.focus()
}
function check()
{
	no = document.mat.mno.value
	des = document.mat.mdes.value
	qty = document.mat.mqty.value
	if(no==""||des==""||qty=="")
	{
		alert("Please fill in all the fields!")
		document.mat.mno.focus()
		return false
	}
	for(var i=0;i<qty.length;i++)
	{
		if((qty.charCodeAt(i)>64&&qty.charCodeAt(i)<91)||(qty.charCodeAt(i)>96&&qty.charCodeAt(i)<123)||(qty.charCodeAt(i)==45)||(qty.charCodeAt(i)==46)||(qty.charCodeAt(i)==95)||(qty.charCodeAt(i)==""))
		{
			alert("Quantity no. must be numeric!")
			document.mat.mqty.focus()
			return false
		}
	}
	return true
}
function addmat()
{
	if(check())
		return true
	else
		return false
}
function modmat()
{
	if(!check())
	{
		return false
	}
	else
	{
		document.mat.hiddenmatno.value=document.mat.matname.options[document.mat.matname.selectedIndex].text
		document.mat.action="modmat.jsp"
		document.mat.target="_self"
		return true
	}
}

function delmat()
{
	document.mat.hiddenmatno.value=document.mat.matname.options[document.mat.matname.selectedIndex].text
	document.mat.action="delmat.jsp"
	document.mat.target="_self"
}

function matSelected()
{
	if(document.mat.matname.options[document.mat.matname.selectedIndex].text=="")
	{
		document.mat.add.disabled = false
		document.mat.mod.disabled = true
		document.mat.del.disabled = true
		document.mat.mno.disabled = false
		document.mat.mdes.disabled = false
		document.mat.mqty.disabled = false
		document.mat.mno.value = ""
		document.mat.mdes.value = ""
		document.mat.mqty.value = ""
		document.mat.mno.focus()
	}
	else
	{
		
		document.mat.add.disabled = true
		document.mat.mod.disabled = false
		document.mat.del.disabled = false
		document.mat.mno.disabled = false
		document.mat.mdes.disabled = false
		document.mat.mqty.disabled = false
		document.mat.mno.focus()
	}

}