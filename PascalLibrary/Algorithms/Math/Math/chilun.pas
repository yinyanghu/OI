program chilun;
var na,nb,nc,ma,mb,mc,k:integer;
function gcd(a,b:integer):integer;
 begin
     if b=0 then gcd:=a
       else gcd:=gcd(b,a mod b);
 end;
function lcm(x,y:integer):integer;
 begin
     lcm:=x*y div gcd(x,y);
 end;
function lcm3(a1,a2,a3:integer):integer;
 begin
     lcm3:=lcm(lcm(a1,a2),a3);
 end;

begin
    readln(na,nb,nc);
    if (na<1) or (nb<1) or (nc<1) then begin
        writeln('Input Error!');
        readln;
        halt;
    end;
    k:=lcm3(na,nb,nc);
    writeln('Min gong bei number=',k);
    ma:=k div na;
    mb:=k div nb;
    mc:=k div nc;
    writeln(ma:5,mb:5,mc:5);
    readln;
end.