
SelectLine(0);
Left_Sel(0);

var slctd_str = GetSelectedString;

slctd_str = slctd_str.replace(/^\s+|\s+$/g, '');

ExecCommand('explorer ' + '"' + slctd_str + '"', 0);
