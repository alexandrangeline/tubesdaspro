unit F12;
interface
	uses typelist;
	procedure statistik (var lUser : List_User; lBuku : List_Buku );
implementation
	procedure statistik (var lUser : List_User; lBuku : List_Buku );
	var
		i : integer;
		admin,pengunjung,sastra,sains,manga,sejarah,programming: integer;
	begin
		{Pengkondisian awal semua variabel 0}
		admin:= 0;
		pengunjung:=0;
		sastra:=0;
		sains:=0;
		manga:=0;
		sejarah:=0;
		programming:=0;
		{mengecek dari awal sampai akhir data untuk jumlah admin, pengunjung dan masing masing kategori buku}
		for i:= 1 to (lUser.Neff) do begin
			if lUser.listuser[i].Role = 'admin' then begin
				admin:= admin+1;
			end else begin
				pengunjung:=pengunjung+1;
			end;
		end;
		for i:= 1 to (lBuku.Neff) do begin
			if (lBuku.listbuku[i].Kategori = 'sastra') then begin
				sastra := sastra+lBuku.listbuku[i].Jumlah_Buku;
			end else if (lBuku.listbuku[i].Kategori = 'sains') then begin
				sains := sains+lBuku.listbuku[i].Jumlah_Buku;
			end else if (lBuku.listbuku[i].Kategori = 'manga')  then begin
				manga := manga+lBuku.listbuku[i].Jumlah_Buku;
			end else if (lBuku.listbuku[i].Kategori = 'sejarah')  then begin
				sejarah := sejarah+lBuku.listbuku[i].Jumlah_Buku;
			end else begin
				programming := programming+lBuku.listbuku[i].Jumlah_Buku;
			end;
		end;
		writeln('Pengguna:');
		write('Admin | ');
		writeln (admin);
		write('Pengunjung | ');
		writeln( pengunjung);
		write('Total | ');
		writeln(admin + pengunjung);
		writeln('Buku:');
		write('Sastra | ');
		writeln( sastra);
		write('Sains | ');
		writeln(sains);
		write('Manga | ');
		writeln(manga);
		write('Sejarah | ');
		writeln( sejarah);
		write('programming | ');
		writeln( programming);
		write('Total | ');
		writeln( (sains + sastra + manga + sejarah + programming));
	end;
end.
