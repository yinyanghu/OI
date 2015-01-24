{
	Simluate
}
program Ural_1299(Input,Output);
type
	TIndex=Int64;
var
	Energy,Ammunition,
	Enemy,EnemyEnergy,DangerAngle,
	Allied,AlliedEnergy,NextAngle:TIndex;
	Pattern:Char;
function Min(A,B:TIndex):TIndex;
begin
	if A<B then Result:=A
	else Result:=B;
end;
procedure Retreats_Returns_Fire;
begin
	if (Abs(DangerAngle)>=5) or (Enemy=0) then
		Writeln('BACKWARD ',Min(Energy,100))
	else
		Writeln('FIRE ',Min(Ammunition,20));
end;
procedure Advances_Returns_Fire;
begin
	if (Abs(DangerAngle)>=10) or (Enemy=0) then
		Writeln('FRONT ',Min(Energy,100))
	else
		Writeln('FIRE ',Min(Ammunition,20));
end;
procedure Attack;
begin
	if Allied*AlliedEnergy>Enemy*EnemyEnergy*3 then
		Advances_Returns_Fire
	else
		Retreats_Returns_Fire;
end;
procedure Guard;
begin
	if Enemy=0 then
		Writeln('STOP')
	else if Abs(DangerAngle)<5 then
		Writeln('FIRE ',Min(Ammunition,20))
	else if DangerAngle>=5 then
		Writeln('LEFT ',Min(Energy,100))
	else if DangerAngle<=-5 then
		Writeln('RIGHT ',Min(Energy,100));
end;
procedure Defense;
begin
	if Enemy*20>Ammunition then
		Retreats_Returns_Fire
	else
		Guard;
end;
procedure Patrolling;
//Important. Minimize the turning angle.
begin
	if Enemy>0 then
		Defense
	else if Abs(NextAngle)<=20 then
		Writeln('FRONT ',Min(Energy,100))
	else if (NextAngle>=160) or (NextAngle<=-160) then
		Writeln('BACKWARD ',Min(Energy,100))
	else if ((-160<NextAngle) and (NextAngle<-90))
		or ((20<NextAngle) and (NextAngle<=90)) then
		Writeln('LEFT ',Min(Energy,100))
	else if ((-90<=NextAngle) and (NextAngle<-20))
		or ((90<NextAngle) and (NextAngle<160)) then
		Writeln('RIGHT ',Min(Energy,100));
end;
procedure Main;
begin
	Readln(Energy,Ammunition);
	repeat
		Read(Pattern);
	until Pattern in ['A','D','P','G'];
	Readln;
	Readln(Enemy,EnemyEnergy,DangerAngle);
	case Pattern of
		'A':
			begin
				Readln(Allied,AlliedEnergy);
				Attack;
			end;
		'D':Defense;
		'P':
			begin
				Readln(NextAngle);
				Patrolling;
			end;
		'G':Guard;
	end;
end;
begin
	Main;
end.

