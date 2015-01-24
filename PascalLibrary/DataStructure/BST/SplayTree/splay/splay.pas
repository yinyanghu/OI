program splaytree;
const maxn=50000;
var key,count,left,right,size,a,b:array[0..maxn] of longint;
    root,tt,n:longint;
procedure initialize;
 begin
     fillchar(left,sizeof(left),0);
     fillchar(right,sizeof(right),0);
     fillchar(key,sizeof(key),0);
     fillchar(count,sizeof(count),0);
     fillchar(size,sizeof(size),0);
 end;

procedure updata(var t:longint);
 begin
     size[t]:=size[left[t]]+size[right[t]]+count[t];
 end;
 
procedure left_rotate(var t:longint);
 var k:longint;
 begin
     k:=left[t]; left[t]:=right[k]; right[k]:=t; updata(t); updata(k); t:=k;
 end;

procedure right_rotate(var t:longint);
 var k:longint;
 begin
     k:=right[t]; right[t]:=left[k]; left[k]:=t; updata(t); updata(k); t:=k;
 end;

procedure splay(var t:longint; x:longint);
 begin
     if x<key[t] then begin
        if left[t]<>0 then begin
            splay(left[t],x);
            left_rotate(t);
        end;
     end else if x>key[t] then begin
         if right[t]<>0 then begin
             splay(right[t],x);
             right_rotate(t);
         end;
     end;
     updata(t);
 end;

procedure insert(x:longint);
 begin
     splay(root,x);
     if x<key[root] then begin
        inc(tt);
        key[tt]:=x; count[tt]:=1;
        left[tt]:=left[root];
        left[root]:=0;
        updata(root);
        right[tt]:=root;
        root:=tt;
     end else if x>key[root] then begin
        inc(tt);
        key[tt]:=x; count[tt]:=1;
        right[tt]:=right[root];
        right[root]:=0;
        updata(root);
        left[tt]:=root;
        root:=tt;
     end else inc(count[root]);
     updata(root);
 end;

procedure delete(x:longint);
 var k:longint;
 begin
     splay(root,x);
     if x=key[root] then
     	if count[root]>1 then dec(count[root])
              else begin
                  if left[root]=0 then k:=right[root]
                       else begin
                           k:=left[root];
                           splay(k,x);
                           right[k]:=right[root];
                       end;
                  root:=k;
              end;
     updata(root);
 end;

function find(x:longint):boolean;
 begin
     splay(root,x);
     find:=key[root]=x;
 end;

function rank(x:longint):longint;
 begin
     splay(root,x);
     rank:=size[left[root]]+1;
 end;
 
function select(x:longint):longint;
 var k:longint;
 begin
     k:=root;
     while k<>0 do
     	if x<=size[left[k]] then k:=left[k]
            else begin
                dec(x,size[left[k]]);
                if x<=count[k] then break;
                dec(x,count[k]);
                k:=right[k];
            end;
     splay(root,key[k]);
     select:=key[k];
 end;
 
function minimum:longint;
 begin
     splay(root,-maxlongint);
     minimum:=key[root];
 end;

function maximum:longint;
 begin
     splay(root,maxlongint);
     maximum:=key[root];
 end;

function pred(t,x:longint):longint;
 begin
     if t=0 then exit(x);
     if x<=key[t] then pred:=pred(left[t],x)
     	else begin
             pred:=pred(right[t],x);
             if pred=x then pred:=key[t];
         end;
 end;

function succ(t,x:longint):longint;
 begin
     if t=0 then exit(x);
     if key[t]<=x then succ:=succ(right[t],x)
     	else begin
             succ:=succ(left[t],x);
             if succ=x then succ:=key[t];
         end;
 end;

procedure init;
 var i:longint;
 begin
     readln(n);
     for i:=1 to n do begin
         read(a[i]);
         if (a[i]<>8) and (a[i]<>9) then readln(b[i]);
     end;
 end;

procedure main;
 var i:longint;
 begin
     initialize;
     root:=0; tt:=0;
     for i:=1 to n do
       case a[i] of
           1:insert(b[i]);
           2:delete(b[i]);
           3:writeln(find(b[i]));
           4:writeln(rank(b[i]));
           5:writeln(select(b[i]));
           6:writeln(pred(root,b[i]));
           7:writeln(succ(root,b[i]));
           8:writeln(maximum);
           9:writeln(minimum);
       end;
 end;

begin
    assign(input,'splay.in'); reset(input);
    assign(output,'splay.out'); rewrite(output);
    init;
    main;
    close(input);
    close(output);
end.

