var mno, mat, qty

function modClicked()
{
	document.mpo.action="modpoheader.jsp"
	document.mpo.target="_self"
}
/*
function check()
{
	mno = document.mpo.mno.value
	mat = document.mpo.mat.value
	qty = document.mpo.qty.value
	if(mno==""||mat==""||qty=="")
	{
		alert("Please fill in the details!")
		document.mpo.mno.focus()
		return false
	}
	for(var i=0;i<qty.length;i++)
	{
		if((qty.charCodeAt(i)>64&&qty.charCodeAt(i)<91)||(qty.charCodeAt(i)>96&&qty.charCodeAt(i)<123)||(qty.charCodeAt(i)==45)||(qty.charCodeAt(i)==46)||(qty.charCodeAt(i)==95)||(qty.charCodeAt(i)==""))
		{
			alert("Quantity no. must be numeric!")
			document.mpo.qty.select()
			document.mpo.qty.focus()
			return false
		}
	}
	return true
}
function addmat()
{
	if(check())
	{
		//document.mpo.action="newpo1.jsp"
		//@TODO
		document.mpo.target="_self"
		return true
	}
	else
		return false
}
*/
