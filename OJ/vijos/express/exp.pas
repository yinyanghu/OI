program express;
type node=record
         ch:char;
         n,m:integer;
         sum:longint;
     end;
var a:array[1..100] of node;
    i,j,k,p,l,r,top:integer;
    w1,w2,w3,w4:integer;
    s,temp:string;
procedure find(l,r:integer);
 var i,j,k:integer;
 begin
     if l<r then begin
         if s[l]='(' then begin
             inc(i);
             if s[i]='(' then inc(i)
         end;
     end;
     find:=k;
 end;

begin
    assign(input,'express.in'); reset(input);
    assign(output,'express.out'); rewrite(output);
    readln(s); temp:=s; top:=1;
    s:='('+s+')';
    while s<>'' do begin
        p:=find;
        l:=p-1; r:=p+1;
        while s[l] in ['0'..'9'] do dec(l);
        while s[r] in ['0'..'9'] do inc(r);
        w1:=0; w2:=0;
        for i:=p-1 downto l do w1:=w1*10+(ord(s[i])-ord('0'));
        for i:=r downto p+1 do w2:=w2*10+(ord(s[i])-ord('0'));
        a[top].n:=w1; a[top].m:=w2;
        case s[p] of
            '+':begin a[top].sum:=w1+w2; a[top].ch:='+'; end;
            '-':begin a[top].sum:=w1-w2; a[top].ch:='-'; end;
            '*':begin a[top].sum:=w1*w2; a[top].ch:='*'; end;
            '/':begin a[top].sum:=w1 div w2; a[top].ch:='/' end;
        end;
        inc(top);
        delete(s,l,r-l+1);
    end;
    close(input);
    close(output);
end.
