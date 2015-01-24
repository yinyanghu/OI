{l=(3,4,3,4,K,8,0,8,P)
 k=(5,5,8,9,9,4)
 P=(4,7,8,9)}
program guangyibiao;
const maxn=100;
type list=record
         length:integer;
         e:array[1..maxn] of char;
     end;
     queue=record
         a:array[0..maxn] of char;
         f,r:integer;
     end;
var t:array['A'..'Z'] of list;
    q:queue;
    c:char;
    s:string;
    i:integer;

procedure inqueue(var q:queue; c:char);
 begin
     inc(q.r);
     q.a[q.r]:=c;
 end;

function outqueue(var q:queue):char;
 begin
     inc(q.f);
     outqueue:=q.a[q.f];
 end;

function maxnum(c:char):char;
 var ch,m,max:char;
     i:integer;
 begin
     max:='0';
     for i:=1 to t[c].length do begin
         ch:=t[c].e[i];
         if ch in ['A'..'Z'] then m:=maxnum(ch)
           else m:=ch;
         if max<m then max:=m;
     end;
     maxnum:=max;
 end;

function total(c:char):integer;
 var k,i,m:integer;
     ch:char;
 begin
     k:=0;
     for i:=1 to t[c].length do begin
         ch:=t[c].e[i];
         if ch in ['A'..'Z'] then m:=total(ch)
           else m:=ord(ch)-ord('0');
         k:=k+m;
     end;
     total:=k;
 end;

begin
    assign(input,'guanyibiao.in'); reset(input);
    for c:='A' to 'Z' do t[c].length:=0;
    q.f:=0; q.r:=0;
    inqueue(q,'L');
    while q.f<>q.r do begin
        c:=outqueue(q);
        write(c,'=');
        readln(s);
        i:=1;
        while s[i]<>'(' do inc(i);
        while s[i]<>')' do begin
            s[i]:=upcase(s[i]);
            if s[i] in ['A'..'Z','0'..'9'] then begin
                inc(t[c].length);
                t[c].e[t[c].length]:=s[i];
                if s[i] in ['A'..'Z'] then inqueue(q,s[i]);
            end;
            inc(i);
        end;
    end;
    assign(output,'guanyibiao.out'); rewrite(output);
    writeln('Total is :',total('L'));
    writeln(' Max  is :',maxnum('L'));
    close(input);
    close(output);
end.