Unit F04;
interface 
uses typelist, F13;
procedure caribukutahun (var Tbuku : List_Buku);
{Prosedur untuk menerima input dari user dan menampilkan ke layar buku-buku yang tahun terbitnya sesuai dengan input user}
implementation
procedure caribukutahun (var Tbuku : List_Buku);
{Prosedur untuk menerima input dari user dan menampilkan ke layar buku-buku yang tahun terbitnya sesuai dengan input user}
{Kamus Lokal}
var 
	year : integer ;
	orelasional : char ;
	count : integer ;
	i : integer ;
begin
	// input user
	write('Masukkan tahun: ');
	readln(year);
	write('Masukkan kategori: ');
	readln(orelasional);
	// inisialisasi
	count := 0; 
	writeln('Buku yang terbit ',orelasional,' ',year,' :');
	// analisis kasus
	if (orelasional = '>') then
	begin 
		// aksi ketika orelasional = '>'
		for i := 1 to Tbuku.Neff do 
		begin
			if ((Tbuku.listbuku[i].Tahun_Penerbit) > year) then 
			begin
				// aksi mencetak
				writeln(Tbuku.listbuku[i].ID_Buku,' | ',Tbuku.listbuku[i].Judul_Buku,' | ',Tbuku.listbuku[i].Author);
				count := count + 1;
			end;
		end;
	end else if (orelasional = '>=') then
	begin
		// aksi ketika orelasional = '>='
		for i := 1 to Tbuku.Neff do 
		begin
			if ((Tbuku.listbuku[i].Tahun_Penerbit) >= year) then 
			begin
				// aksi mencetak
				writeln(Tbuku.listbuku[i].ID_Buku,' | ',Tbuku.listbuku[i].Judul_Buku,' | ',Tbuku.listbuku[i].Author);
				count := count + 1;
			end;
		end;
	end else if (orelasional = '<') then
	begin
		// aksi ketika orelasional = '<'
		for i := 1 to Tbuku.Neff do 
		begin
			if ((Tbuku.listbuku[i].Tahun_Penerbit) < year) then 
			begin
				// aksi mencetak
				writeln(Tbuku.listbuku[i].ID_Buku,' | ',Tbuku.listbuku[i].Judul_Buku,' | ',Tbuku.listbuku[i].Author);
				count := count + 1;
			end;
		end;
	end else if (orelasional = '<=') then
	begin 
		// aksi ketika orelasional = '<='
		for i := 1 to Tbuku.Neff do 
		begin
			if ((Tbuku.listbuku[i].Tahun_Penerbit) <= year) then 
			begin
				// aksi mencetak
				writeln(Tbuku.listbuku[i].ID_Buku,' | ',Tbuku.listbuku[i].Judul_Buku,' | ',Tbuku.listbuku[i].Author);
				count := count + 1;
			end;
		end;
	end else
		// aksi ketika orelasional = '='
	begin 
		for i := 1 to Tbuku.Neff do 
		begin
			if ((Tbuku.listbuku[i].Tahun_Penerbit) = year) then 
			begin
				// aksi mencetak
				writeln(Tbuku.listbuku[i].ID_Buku,' | ',Tbuku.listbuku[i].Judul_Buku,' | ',Tbuku.listbuku[i].Author);
				count := count + 1;
			end;
		end;
	end;
	// analisis kasus
	if (count = 0) then 
	begin 
		// aksi ketika tidak ada buku yang sesuai dengan tahun terbit yang diinput user 
		writeln('Tidak ada buku dalam kategori ini.');
	end;
end;
end.
