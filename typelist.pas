unit typelist;
interface
	type
		tanggal = record
				hari: integer;
				bulan: integer;
				tahun: integer;
		end;
		Buku = record
				ID_Buku: integer;
				Judul_Buku: string;
				Author: string; 
				Jumlah_Buku: integer;
				Tahun_Penerbit: integer;
				Kategori : string; 
		end;
		List_Buku = record
					listbuku : array [1..100] of Buku;
					Neff : integer; {list yang terisi}
		end;
		User = record
				Nama : string;
				Alamat: string;
				Username : string;
				Password : string;
				Role : string; 
		end;
		List_User = record
					listuser : array [1..100] of User;
					Neff : integer; {list yang terisi}
		end;
		Peminjaman = record
				Username:string;
				ID_Buku: integer;
				Tanggal_Peminjaman: tanggal;
				Tanggal_Batas_Pengembalian: tanggal;
				Status_Pengembalian: string;
		end;
		List_Peminjaman = record
					listPeminjaman : array [1..100] of Peminjaman;
					Neff : integer; {list yang terisi}
		end;
		Pengembalian = record
				Username:string;
				ID_Buku: integer;
				Tanggal_Pengembalian: tanggal;
		end;
		List_Pengembalian = record
					listPengembalian : array [1..100] of Pengembalian;
					Neff : integer; {list yang terisi}
		end;
		Buku_Hilang = record
				Username:string;
				ID_Buku_Hilang: integer;
				Tanggal_Laporan: tanggal;
		end;
		List_Buku_Hilang = record
					listBuku_Hilang : array [1..100] of Buku_Hilang;
					Neff : integer; {list yang terisi}
		end;
implementation
end.
