var mno, mat, qty

function check()
{
	mno = document.po2.mno.value
	mat = document.po2.mat.value
	qty = document.po2.qty.value
	if(mno==""||mat==""||qty=="")
	{
		alert("Please fill in the details!")
		document.po2.mno.focus()
		return false
	}
	else
		return true
}
function addmat()
{
	if(check())
	{
		document.po2.action="newpo1.jsp"
		document.po2.target="_self"
		return true
	}
	else
		return false
}
