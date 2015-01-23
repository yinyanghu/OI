program num;
var j1,j2,f1,f2,total:longint;
    i:longint;

function ok(x:longint):longint;
var i,j,p:longint;
    a:array[1..40] of longint;
    k:longint;
    b:boolean;
begin
     p:=0;
     fillchar(a,sizeof(a),0);
     for i:=j1 to j2 do begin
        k:=x;
        j:=0;
        b:=true;
        while k<>0 do begin
             inc(j);
             a[j]:=k mod i;
             k:=k div i;
             if (j>2) and (a[j]<>a[j-2]) then begin
		 b:=false;
	         break;
             end;
             if (j>1) and (a[j]=a[j-1]) then begin
                 b:=false;
		 break;
             end;
         end;
         if b then inc(p);
         if p>total then break;
     end;
     ok:=p;
end;

begin
     assign(input,'num.in');reset(input);
     assign(output,'num.out');rewrite(output);
     readln(j1,j2,f1,f2,total);
     for i:=f1 to f2 do
        if ok(i)=total then writeln(i);
     close(input);
     close(output);
end.