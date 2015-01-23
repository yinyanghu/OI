program egpty;
var a,b,maxlen,min:cardinal;
    ans,s:array[0..1000] of cardinal;

function gcd(m,n:cardinal):cardinal;
 begin
     if m=0 then gcd:=n
        else gcd:=gcd(n mod m,m);
 end;

function max(m,n:cardinal):cardinal;
 begin
     if m>n then max:=m else max:=n;
 end;

function getmin(m,n:cardinal):cardinal;
 begin
     if m<n then getmin:=m else getmin:=n;
 end;

procedure yuefen(var m,n:cardinal);
 var c:cardinal;
 begin
     if n<m then begin
        c:=gcd(n,m);
        while c<>1 do begin
            while (m mod c=0) and (n mod c=0) do begin
                m:=m div c;
                n:=n div c;
            end;
            c:=gcd(n,m);
        end;
     end else begin
         c:=gcd(m,n);
         while c<>1 do begin
             while (m mod c=0)and(n mod c=0) do begin
                 m:=m div c;
                 n:=n div c;
             end;
             c:=gcd(m,n);
         end;
     end;
 end;

procedure print;
 var i:cardinal;
 begin
      for i:=1 to maxlen-1 do write(ans[i],' ');
      writeln(ans[maxlen]);
 end;

procedure deal(x,y,z:cardinal; var a,b:cardinal);
 var k:cardinal;
 begin
     if y>z then k:=gcd(z,y) else k:=gcd(y,z);
     a:=(z div k)*x-y div k;
     b:=(z div k)*y;
     yuefen(a,b);
 end;

procedure dfs(k,u,v:cardinal);
 var i,j,p,q,r,t:cardinal;
 begin
     if (u=1) and (v>s[k-1]) and (v<min) then begin
         s[maxlen]:=v;
         ans:=s;
         min:=v;
     end;
     if k>=maxlen then exit;
     p:=max(trunc(v/u)+1,s[k-1]+1);
     if p>min then exit;
     if (1/p)*(maxlen-k+1)<u/v then exit;
     q:=getmin(min-1,trunc(v*(maxlen-k+1)/u));
     for i:=p to q do
       if i<min then begin
          deal(u,v,i,r,t);
          s[k]:=i;
          dfs(k+1,r,t);
       end else break;
 end;

begin
    assign(input,'fen.in'); reset(input);
    fillchar(s,sizeof(s),0);
    readln(a,b);
    close(input);
    if a=1 then begin
        writeln(a,' ',b);
        halt;
    end;
    for maxlen:=2 to 1000 do begin
        min:=maxlongint;
        dfs(1,a,b);
        if min<>maxlongint then break;
    end;
    print;
end.