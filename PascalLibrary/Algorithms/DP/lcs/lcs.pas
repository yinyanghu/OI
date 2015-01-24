program lcs;
const maxlen=200;
var i,j:longint;
    c:array[0..maxlen,0..maxlen] of byte;
    x,y,z:string;
begin
     readln(x); readln(y);
     fillchar(c,sizeof(c),0);
     for i:=1 to length(x) do
         for j:=1 to length(y) do
             if x[i]=y[j] then c[i,j]:=c[i-1,j-1]+1
                else if c[i-1,j]>c[i,j-1]
                        then c[i,j]:=c[i-1,j]
                        else c[i,j]:=c[i,j-1];
     z:='';
     i:=length(x);
     j:=length(y);
     writeln(c[i,j]);
     while (i>0) and (j>0) do
          if x[i]=y[j]
             then begin z:=x[i]+z;i:=i-1;j:=j-1 end
             else if c[i-1,j]>c[i,j-1]
                  then i:=i-1
                  else j:=j-1;
     if z<>'' then writeln(z);
end.