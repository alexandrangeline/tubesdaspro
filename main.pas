Program mainprogram;

uses F01, F02, F03, F04, F05, F06, F07, F08, F09, F10, F11, F12, F13, F14, F15, F16, typelist;

var
	lBuku : List_Buku;
	lUser : List_User;
	lPeminjaman: List_Peminjaman;
	lPengembalian: List_Pengembalian;
	lHilang: List_Buku_Hilang;
	filebuku, fileuser, filepeminjaman, filepengembalian, filehilang, username, role, pilihan: string;
	
	exitprogram, exitlogin: boolean;

begin
	filebuku:= 'lib.csv';
	fileuser:='listorang.csv';
	filepeminjaman:= 'File Histori Peminjaman.csv';
	filepengembalian:= 'File Histori Pengembalian.csv';
	filehilang:= 'filehilang.csv';
	//saat program pertama kali berjalan akan melakukan fungsi load yang akan meminta nama file yang akan di load #F13
	//write('Masukkan nama File Buku: ');
	//readln(filebuku);
	loadBuku(filebuku, lBuku);
	//write('Masukkan nama File User: ');
	//readln(fileuser);
	loadUser(fileuser, lUser);
	//write('Masukkan nama File Peminjaman: ');
	//readln(filepeminjaman);
	loadPeminjaman(filepeminjaman, lPeminjaman);
	//write('Masukkan nama File Pengembalian: ');
	//readln(filepengembalian);
	loadPengembalian(filepengembalian, lPengembalian);
	//write('Masukkan nama File Buku Hilang: ');
	//readln(filehilang);
	loadBuku_Hilang(filehilang, lHilang);
	writeln('File perpustakaan berhasil dimuat!');
	
	exitprogram:= false;
	while not exitprogram do begin
		writeln();
		writeln('Selamat datang di perpustakaan kota Ba Sing Tse');
		writeln();
		writeln('> login');
		writeln('> keluar_program');
		repeat
			write('Masukkan command yang anda inginkan: ');
			readln(pilihan);
			writeln();
			if (pilihan<>'login') and (pilihan<>'keluar_program') then begin
				writeln('Pilihan tidak tersedia! Masukkan command dengan benar!');
			end;
		until (pilihan='login') or (pilihan='keluar_program');
		if (pilihan = 'login') then begin
		//kemudian program akan meminta login #F02
			masuk(lUser, username, role);
			exitlogin:= false;
			while not exitlogin do begin
			//login as non admin
				if (role=('pengunjung')) then begin
					pilihan:= '';
					writeln();
					writeln('Menu pilihan');
					writeln('> cari_kategori (Pencarian buku berdasarkan kategori)');
					writeln('> cari_tahunterbit (Pencarian buku berdasarkan tahun terbit)');
					writeln('> pinjam_buku (Peminjaman buku)');
					writeln('> kembali_buku (Pengembalian buku)');
					writeln('> lapor_hilang (Pelaporan buku hilang)');
					writeln('> exit ');
					writeln('');
					repeat
						write('Masukkan command yang anda inginkan: ');
						readln(pilihan);
						writeln();
						if (pilihan<>'cari_kategori') and (pilihan<>'cari_tahunterbit') and (pilihan<>'pinjam_buku') and (pilihan<>'kembali_buku') and (pilihan<>'lapor_hilang') and (pilihan<>'exit') then begin
							writeln('Pilihan tidak tersedia! Masukkan command dengan benar!');
						end;
					until ((pilihan='cari_kategori') or (pilihan='cari_tahunterbit')or (pilihan='pinjam_buku')or (pilihan='kembali_buku')or (pilihan='lapor_hilang')or (pilihan='exit'));
					if (pilihan = 'cari_kategori') then begin
					//cari buku berdasarkan kategori buku #F03
						ngurutbuku(lbuku);
						caribukukategori(lBuku);
						
					end else if (pilihan = 'cari_tahunterbit') then begin
					//cari buku berdasarkan tahun terbit #F04
						ngurutbuku(lbuku);
						caribukutahun(lBuku);
						
					end else if (pilihan = 'pinjam_buku') then begin	
					//meminjam buku #F05
						//peminjaman(username, lPeminjaman, lBuku);
						
					end else if (pilihan = 'kembali_buku') then begin
					//mengembalikan buku #F06
						//pengembalian(lBuku, lPengembalian, lPeminjaman, username);
					
					end else if (pilihan = 'lapor_hilang') then begin
					//melaporkan buku hilang #F07
						lapor_hilang(lHilang, username);
						
					end else if (pilihan = 'exit') then begin
					//exit #F16
						keluar(lBuku, lUser, lPeminjaman, lPengembalian, lHilang, filebuku, fileuser, filepeminjaman, filepengembalian, filehilang);
						exitlogin:=true;
					end;
					
				//login as admin
				end else if (role='admin') then begin
					pilihan:= '';
					writeln();
					writeln('Menu pilihan');
					writeln('> registrasi_user (Registrasi user)');
					writeln('> cari_kategori (Pencarian buku berdasarkan kategori)');
					writeln('> cari_tahunterbit (Pencarian buku berdasarkan tahun terbit)');
					writeln('> lihat_laporan (Melihat laporan buku hilang)');
					writeln('> tambah_baru (Penambahan buku baru)');
					writeln('> tambah_jumlah (Penambahan jumlah buku)');
					writeln('> riwayat_peminjaman (Riwayat peminjaman)');
					writeln('> statistik (Statistik data perpustakaan)');
					writeln('> save (Save file)');
					writeln('> cari_anggota (Pencarian data anggota)');
					writeln('> exit');
					writeln('');
					repeat
						write('Masukkan command yang anda inginkan: ');
						readln(pilihan);
						writeln();
						if (pilihan<>'cari_kategori') and (pilihan<>'cari_tahunterbit') and (pilihan<>'registrasi_user') and (pilihan<>'lihat_laporan')and (pilihan<>'tambah_baru')and (pilihan<>'tambah_jumlah')and (pilihan<>'riwayat_peminjaman')and (pilihan<>'statistik')and (pilihan<>'save')and (pilihan<>'cari_anggota') and (pilihan <> 'exit') then begin
							writeln('Pilihan tidak tersedia! Masukkan command dengan benar!');
						end;
					until (pilihan='cari_kategori') or(pilihan='cari_tahunterbit') or (pilihan='registrasi_user') or (pilihan='lihat_laporan')or (pilihan='tambah_baru')or (pilihan='tambah_jumlah')or (pilihan='riwayat_peminjaman')or (pilihan='statistik')or (pilihan='save')or (pilihan='cari_anggota') or (pilihan = 'exit');
					if (pilihan='registrasi_user') then begin
					//registrasi akun baru #F01
						registrasiuser(lUser);
						
					end else if (pilihan = 'cari_kategori') then begin
					//cari buku berdasarkan kategori buku #F03
						caribukukategori(lBuku);
						
					end else if (pilihan = 'cari_tahunterbit') then begin
					//cari buku berdasarkan tahun terbit #F04
						caribukutahun(lBuku);
						
					end else if (pilihan = 'lihat_laporan') then begin
					//melihat laporan buku hilang #F08
						lihat_laporan(lHilang, lBuku);
					
					end else if (pilihan = 'tambah_baru') then begin
					//menambah buku baru ke sistem #F09
						tambah_buku(lBuku);
					
					end else if (pilihan = 'tambah_jumlah') then begin
					//menambah jumlah buku ke sistem #F10
						penambahan_buku(lBuku);
						
					end else if (pilihan = 'riwayat_peminjaman') then begin
					//melihat riwayat peminjaman #F11
						riwayat(lPeminjaman, username, lBuku);
						
					end else if (pilihan = 'statistik') then begin
					//melihat statistik #F12
						statistik(lUser, lBuku);
						
					end else if (pilihan = 'save') then begin
					//save file #F14
						Save(lBuku, lUser, lPeminjaman, lPengembalian, lHilang, filebuku, fileuser, filepeminjaman, filepengembalian, filehilang);
						LoadExit(lBuku, lUser, lPeminjaman, lPengembalian, lHilang, filebuku, fileuser, filepeminjaman, filepengembalian, filehilang);
					end else if (pilihan = 'cari_anggota') then begin
					//mencari data anggota #F15
						Search(lUser);
						
					end else if (pilihan = 'exit') then begin
					//exit #F16
						keluar(lBuku, lUser, lPeminjaman, lPengembalian, lHilang, filebuku, fileuser, filepeminjaman, filepengembalian, filehilang);
						exitlogin:= true;
					end;
				end;
			end;
		end else begin
			exitprogram:= true;
		end;	
	end;
end.
