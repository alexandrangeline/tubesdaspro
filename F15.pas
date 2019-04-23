unit F15;
interface
	uses typelist;
	procedure Search (lUser: List_User);
	
implementation
	procedure Search (lUser: List_User);
	var
		found: boolean;
		i: integer;
		username :string;
	begin
		write('Masukkan username anggota: ');
		readln(username);
		found:= false;
		i:= 0;
		while not (found) and (i<=lUser.Neff) do begin
			inc(i);
			if (lUser.listUser[i].Username = username) then begin
				found:= True;
			end;
		end;
		if found then begin
			writeln('Nama Anggota : ', lUser.listUser[i].Nama);
			writeln('Alamat Anggota : ', lUser.listUser[i].Alamat);
		end else
			writeln('Anggota dengan username ', username, ' tidak ditemukan.');
	end;
end.
