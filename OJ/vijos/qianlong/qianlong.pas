program qianlong;
type arr1=array[1..10] of longint;
     arr2=array[1..2000] of longint;
var a:arr1; f:arr2;
    i,k,n,w,code,l:longint;
    s,p,ans:ansistring;

procedure multiply(x:arr1; y:arr2; var z:arr2);
 var i,j,k:longint;
 begin
     k:=0;
     fillchar(z,sizeof(z),0);
     for i:=1 to 10 do
       for j:=1 to 1500 do begin
           z[i+j-1]:=z[i+j-1]+x[i]*y[j]+k;
           k:=z[i+j-1] div 10;
           z[i+j-1]:=z[i+j-1] mod 10;
       end;
 end;

begin
    assign(input,'qianlong.in'); reset(input);
    while not eof do begin
        fillchar(a,sizeof(a),0);
        readln(s); k:=pos(' ',s);
        p:=copy(s,1,k-1); delete(s,1,k);
        while pos(' ',s)<>0 do delete(s,1,1);
        val(s,n,code);
        k:=pos('.',p); w:=length(p)-k;
        delete(p,k,1); l:=length(p);
        for i:=1 to l do a[i]:=ord(p[l-i+1])-48;
        fillchar(f,sizeof(f),0); f[1]:=1;
        for i:=1 to n do multiply(a,f,f);
        k:=1500; while f[k]=0 do dec(k);
        w:=w*n;
        ans:='';
        for i:=k downto 1 do ans:=ans+chr(f[i]+48);
        insert('.',ans,k-w+1);
        if k<w then
          for i:=1 to w-k do insert('0',ans,2);
        l:=length(ans);
        while (ans[l]='0') and (pos('.',ans)<l) do begin
            delete(ans,l,1);
            l:=length(ans);
        end;
        l:=length(ans);
        if ans[l]='.' then delete(ans,l,1);
        writeln(ans);
    end;
    close(input);
end.


 {t:=1;
        while f[t]=0 do inc(t); dec(t);
        w:=w-t;
        if k>w then
          for i:=k downto t+1 do begin
              write(f[i]);
              if (i=w+t+1) and (i<>k-t) then write('.');
          end;
        if k=w then begin
            write('.');
            for i:=k downto 1 do write(f[i]);
        end;
        if k<w then begin
            write('.');
            for i:=1 to w-k do write('0');
            for i:=k downto t+1 do write(f[i]);
        end;
        writeln; }
