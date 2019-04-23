unit F16;
interface
	uses F14, F13, typelist;
	procedure keluar(var Buku1: List_Buku;var User1: List_User;var Peminjaman1: List_Peminjaman;var Pengembalian1: List_Pengembalian;var Hilang1: List_Buku_Hilang; var filebuku, fileuser, filepeminjaman, filepengembalian, filehilang: string);
implementation
	procedure keluar(var Buku1: List_Buku;var User1: List_User;var Peminjaman1: List_Peminjaman;var Pengembalian1: List_Pengembalian;var Hilang1: List_Buku_Hilang; var filebuku, fileuser, filepeminjaman, filepengembalian, filehilang: string);
	var
		pilihan: char;
	begin
		repeat
			write('Apakah anda mau melakukan penyimpanan file yang sudah dilakukan (Y/N) ? ');
			readln(pilihan);
			if (pilihan = 'Y') then begin
				writeln('Terima kasih telah menggunakan fasilitas perpustakaan kota Ba Sing Tse :)');
				SaveExit(Buku1, User1, Peminjaman1, Pengembalian1, Hilang1,	filebuku, fileuser, filepeminjaman, filepengembalian, filehilang);
				LoadExit(Buku1, User1, Peminjaman1, Pengembalian1, Hilang1, filebuku, fileuser, filepeminjaman, filepengembalian, filehilang);
			end else if (pilihan = 'N') then begin
				writeln('Terima kasih telah menggunakan fasilitas perpustakaan kota Ba Sing Tse :)');
				LoadExit(Buku1, User1, Peminjaman1, Pengembalian1, Hilang1, filebuku, fileuser, filepeminjaman, filepengembalian, filehilang);
			end else begin
				writeln('Pilihan yang anda masukkan salah! Masukkan kembali pilihan anda!');
			end;
		until (pilihan = 'Y') or (pilihan = 'N');	
	end;
	
end.
