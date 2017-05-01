var mno, mat, qty

function check()
{
	mno = document.po1.mno.value
	mat = document.po1.mat.value
	qty = document.po1.qty.value
	if(mno==""||mat==""||qty=="")
	{
		alert("Please fill in the details!")
		document.po1.mno.focus()
		return false
	}
	for(var i=0;i<qty.length;i++)
	{
		if((qty.charCodeAt(i)>64&&qty.charCodeAt(i)<91)||(qty.charCodeAt(i)>96&&qty.charCodeAt(i)<123)||(qty.charCodeAt(i)==45)||(qty.charCodeAt(i)==46)||(qty.charCodeAt(i)==95)||(qty.charCodeAt(i)==""))
		{
			alert("Quantity no. must be numeric!")
			document.po1.qty.select()
			document.po1.qty.focus()
			return false
		}
	}
	return true
}
function addmat()
{
	if(check())
	{
		document.po1.action="newpo1.jsp"
		document.po1.target="_self"
		return true
	}
	else
		return false
}
