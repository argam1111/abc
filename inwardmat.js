var imname, mstock, mminlvl, mmaxlvl, mrolvl

function check()
{
	//imname = document.inwdmat.imname.value
	//mstock = document.inwdmat.imstock.value
	mminlvl = document.inwdmat.immin.value
	mmaxlvl = document.inwdmat.immax.value
	mrolvl = document.inwdmat.imrolvl.value
	if(mminlvl==""||mmaxlvl==""||mrolvl=="")
	{
		alert("pls. input all the fields")
		document.inwdmat.immin.select()
		document.inwdmat.immin.focus()
		return false
	}
	for(var i=0;i<mminlvl.length;i++)
	{
		if((mminlvl.charCodeAt(i)>64&&mminlvl.charCodeAt(i)<91)||(mminlvl.charCodeAt(i)>96&&mminlvl.charCodeAt(i)<123)||(mminlvl.charCodeAt(i)==45)||(mminlvl.charCodeAt(i)==46)||(mminlvl.charCodeAt(i)==95)||(mminlvl.charCodeAt(i)==""))
		{
			alert("Minimum level must be numeric!")
			document.inwdmat.immin.select()
			document.inwdmat.immin.focus()
			return false
		}
	}
	for(var i=0;i<mmaxlvl.length;i++)
	{
		if((mmaxlvl.charCodeAt(i)>64&&mmaxlvl.charCodeAt(i)<91)||(mmaxlvl.charCodeAt(i)>96&&mmaxlvl.charCodeAt(i)<123)||(mmaxlvl.charCodeAt(i)==45)||(mmaxlvl.charCodeAt(i)==46)||(mmaxlvl.charCodeAt(i)==95)||(mmaxlvl.charCodeAt(i)==""))
		{
			alert("Maximum level must be numeric!")
			document.inwdmat.immax.select()
			document.inwdmat.immax.focus()
			return false
		}
	}
	for(var i=0;i<mrolvl.length;i++)
	{
		if((mrolvl.charCodeAt(i)>64&&mrolvl.charCodeAt(i)<91)||(mrolvl.charCodeAt(i)>96&&mrolvl.charCodeAt(i)<123)||(mrolvl.charCodeAt(i)==45)||(mrolvl.charCodeAt(i)==46)||(mrolvl.charCodeAt(i)==95)||(mrolvl.charCodeAt(i)==""))
		{
			alert("Reorder level must be numeric!")
			document.inwdmat.imrolvl.select()
			document.inwdmat.imrolvl.focus()
			return false
		}
	}
	mminlvl = parseInt(document.inwdmat.immin.value)
	mmaxlvl = parseInt(document.inwdmat.immax.value)
	mrolvl = parseInt(document.inwdmat.imrolvl.value)
	if(mminlvl>=mmaxlvl)
	{
		alert("Minimum level should be less than maximum level")
		document.inwdmat.immin.select()
		document.inwdmat.immin.focus()
		return false
	}
	else if(mrolvl<mminlvl)
	{
		alert(" Reorder level cannot be less than minimum level")
		document.inwdmat.imrolvl.select()
		document.inwdmat.imrolvl.focus()
		return false
	}
	else if(mrolvl>=mmaxlvl)
	{
		alert(" Reorder level has to be less than maximum level")
		document.inwdmat.imrolvl.select()
		document.inwdmat.imrolvl.focus()
		return false
	}
	else
		return true
	
}
function addClicked()
{
	if(check())
	{
		document.inwdmat.action="addinmat.jsp"
		document.inwdmat.target="_self"
		return true
	}
	else
		return false
}
function delClicked()
{
	document.inwdmat.action="delinmat.jsp"
	document.inwdmat.target="_self"
}
function determine()
{
	mminlvl = document.inwdmat.immin.value
	mmaxlvl = document.inwdmat.immax.value
	mrolvl = document.inwdmat.imrolvl.value
	if(mminlvl.match("0")&&mmaxlvl.match("0")&&mrolvl.match("0"))
	{
		document.inwdmat.immin.value = ""
		document.inwdmat.immax.value = ""
		document.inwdmat.imrolvl.value = ""
		document.inwdmat.immin.focus()
		document.inwdmat.add.disabled = false
		document.inwdmat.mod.disabled = true
		document.inwdmat.del.disabled = true
	}
	else
	{
		document.inwdmat.add.disabled = true
		document.inwdmat.mod.disabled = false
		document.inwdmat.del.disabled = false
		document.inwdmat.immin.select()
		document.inwdmat.immin.focus()
	}
}
