unit F11;
interface
	uses typelist;
	procedure riwayat (var lPeminjaman : List_Peminjaman; username:string; lBuku : List_Buku );
implementation
	procedure riwayat (var lPeminjaman : List_Peminjaman; username:string; lBuku : List_Buku);
	var
		i,j, temp: integer;
	begin
		write('Masukkan username pengunjung: ');
        readln(username);
        writeln('Riwayat: ');
		i:= 0;
		j:= 0;
		{cari username, lalu menampilkan id buku yang dipinjam beserta judulnya }
		while (lPeminjaman.listPeminjaman[i].Username <> username) and (i<=lPeminjaman.Neff) do
		begin
			inc(i);
		end;
		while (lPeminjaman.listPeminjaman[i].ID_Buku <> lBuku.listbuku[j].ID_Buku) and (i<=lBuku.Neff) do
		begin
			inc(j);
			temp := j
		end;
			write(lPeminjaman.listPeminjaman[i].Tanggal_Peminjaman.hari, '/' ,lPeminjaman.listPeminjaman[i].Tanggal_Peminjaman.bulan, '/' ,lPeminjaman.listPeminjaman[i].Tanggal_Peminjaman.tahun);
			write(' | ');
			write(lPeminjaman.listPeminjaman[i].ID_Buku);
			write(' | ');
			write(lBuku.listbuku[temp].Judul_Buku);
			writeln();
		
	end;
end.
