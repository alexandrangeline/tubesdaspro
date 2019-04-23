Unit F03;
{Unit untuk mengurutkan buku dan mencari berdasarkan kategori yang diinput user}
interface 
uses typelist,F13;
procedure ngurutbuku (var Tbuku : List_Buku);
{prosedur untuk mengurutkan buku-buku yang tersimpan dalam array secara leksikografis}
procedure caribukukategori (var Tbuku : List_Buku);
{prosedur untuk mencetak ke layar ID buku, nama buku, dan author buku untuk buku-buku yang sesuai dengan kategori inputan user} 
implementation
procedure ngurutbuku (var Tbuku : List_Buku);
{prosedur untuk mengurutkan buku-buku yang tersimpan dalam array secara leksikografis}
{Kamus Lokal}
var
	i,j,k : integer;
	stop : boolean;
	temps : string;
	tempi : integer;
begin
	// dilakukan sorting
	for i:= 1 to Tbuku.Neff do
	begin
		for j:= i + 1 to Tbuku.Neff do
		begin
			stop := false ;
			// analisis kasus
			// ketika judul buku yang dibandingkan sama panjang
			if (length(Tbuku.listbuku[i].Judul_Buku)) = (length(Tbuku.listbuku[j].Judul_Buku)) then 
			begin
				// inisialisasi
				k := 1 ;
				while (k <= length(Tbuku.listbuku[i].Judul_Buku)) and (stop=false) do
					begin
						// jika buku yang indexnya lebih kecil memiliki karakter pertama yang nilai ASCIInya lebih besar maka akan dilakukan swapping atau penukaran
						if (ord((Tbuku.listbuku[i].Judul_Buku)[k]) > ord((Tbuku.listbuku[j].Judul_Buku)[k])) then 
						begin
							// aksi penukaran
							Tempi := Tbuku.listbuku[i].ID_Buku ;
							Tbuku.listbuku[i].ID_Buku := Tbuku.listbuku[j].ID_Buku ;
							Tbuku.listbuku[j].ID_Buku := tempi ;
							Temps := Tbuku.listbuku[i].Judul_Buku ;
							Tbuku.listbuku[i].Judul_Buku := Tbuku.listbuku[j].Judul_Buku ;
							Tbuku.listbuku[j].Judul_Buku := temps ;
							Temps := Tbuku.listbuku[i].Author ;
							Tbuku.listbuku[i].Author := Tbuku.listbuku[j].Author ;
							Tbuku.listbuku[j].Author := temps ;
							Tempi := Tbuku.listbuku[i].Jumlah_Buku ;
							Tbuku.listbuku[i].Jumlah_Buku := Tbuku.listbuku[j].Jumlah_Buku ;
							Tbuku.listbuku[j].Jumlah_Buku := tempi ;
							Tempi := Tbuku.listbuku[i].Tahun_Penerbit ;
							Tbuku.listbuku[i].Tahun_Penerbit := Tbuku.listbuku[j].Tahun_Penerbit ;
							Tbuku.listbuku[j].Tahun_Penerbit := tempi ;
							Temps := Tbuku.listbuku[i].Kategori ;
							Tbuku.listbuku[i].Kategori := Tbuku.listbuku[j].Kategori ;
							Tbuku.listbuku[j].Kategori := temps ;
							stop := true ;
						// jika buku yang indexnya lebih kecil memiliki karakter pertama yang nilai ASCIInya lebih kecil maka tidak akan dilakukan swapping atau penukaran melainkan loop diberi sinyal untuk berhenti
						end else if (ord((Tbuku.listbuku[i].Judul_Buku)[k]) < ord((Tbuku.listbuku[j].Judul_Buku)[k])) and (ord((Tbuku.listbuku[i].Judul_Buku)[k]) <> ord((Tbuku.listbuku[j].Judul_Buku)[k]))  then
						begin
							// loop diberi sinyal untuk berhenti
							stop := true ;
						end ;
						// increment
						k := k + 1;
					end;
			// Ketika judul buku yang satu lebih kecil dari yang lain
			end else if (length(Tbuku.listbuku[i].Judul_Buku)) < (length(Tbuku.listbuku[j].Judul_Buku)) then 
			begin
				// inisialisasi
				k := 1 ;
				while (k <= length(Tbuku.listbuku[i].Judul_Buku)) and (stop=false) do
					begin
						// jika buku yang indexnya lebih kecil memiliki karakter pertama yang nilai ASCIInya lebih besar maka akan dilakukan swapping atau penukaran
						if (ord((Tbuku.listbuku[i].Judul_Buku)[k]) > ord((Tbuku.listbuku[j].Judul_Buku)[k])) then 
						begin
							// aksi penukaran
							Tempi := Tbuku.listbuku[i].ID_Buku ;
							Tbuku.listbuku[i].ID_Buku := Tbuku.listbuku[j].ID_Buku ;
							Tbuku.listbuku[j].ID_Buku := tempi ;
							Temps := Tbuku.listbuku[i].Judul_Buku ;
							Tbuku.listbuku[i].Judul_Buku := Tbuku.listbuku[j].Judul_Buku ;
							Tbuku.listbuku[j].Judul_Buku := temps ;
							Temps := Tbuku.listbuku[i].Author ;
							Tbuku.listbuku[i].Author := Tbuku.listbuku[j].Author ;
							Tbuku.listbuku[j].Author := temps ;
							Tempi := Tbuku.listbuku[i].Jumlah_Buku ;
							Tbuku.listbuku[i].Jumlah_Buku := Tbuku.listbuku[j].Jumlah_Buku ;
							Tbuku.listbuku[j].Jumlah_Buku := tempi ;
							Tempi := Tbuku.listbuku[i].Tahun_Penerbit ;
							Tbuku.listbuku[i].Tahun_Penerbit := Tbuku.listbuku[j].Tahun_Penerbit ;
							Tbuku.listbuku[j].Tahun_Penerbit := tempi ;
							Temps := Tbuku.listbuku[i].Kategori ;
							Tbuku.listbuku[i].Kategori := Tbuku.listbuku[j].Kategori ;
							Tbuku.listbuku[j].Kategori := temps ;
							stop := true ;
						// jika buku yang indexnya lebih kecil memiliki karakter pertama yang nilai ASCIInya lebih kecil maka tidak akan dilakukan swapping atau penukaran melainkan loop diberi sinyal untuk berhenti
						end else if (ord((Tbuku.listbuku[i].Judul_Buku)[k]) < ord((Tbuku.listbuku[j].Judul_Buku)[k])) and (ord((Tbuku.listbuku[i].Judul_Buku)[k]) <> ord((Tbuku.listbuku[j].Judul_Buku)[k]))  then
						begin
							// loop diberi sinyal untuk berhenti
							stop := true ;
						end ;
					// increment
					k := k + 1;
					end;
				// jika karakter pertama pada judul-judul buku yang dibandingkan selalu memliki nilai ASCII yang sama sampai seluruh karakter selesai dibandingkan
				// ketika buku yang judulnya lebih panjang berada pada index yang lebih besar maka akan dilakukan swapping atau penukaran
				if (stop = false) and (k > length(Tbuku.listbuku[i].Judul_Buku)) then	
				begin
							//aksi penukaran
							Tempi := Tbuku.listbuku[i].ID_Buku ;
							Tbuku.listbuku[i].ID_Buku := Tbuku.listbuku[j].ID_Buku ;
							Tbuku.listbuku[j].ID_Buku := tempi ;
							Temps := Tbuku.listbuku[i].Judul_Buku ;
							Tbuku.listbuku[i].Judul_Buku := Tbuku.listbuku[j].Judul_Buku ;
							Tbuku.listbuku[j].Judul_Buku := temps ;
							Temps := Tbuku.listbuku[i].Author ;
							Tbuku.listbuku[i].Author := Tbuku.listbuku[j].Author ;
							Tbuku.listbuku[j].Author := temps ;
							Tempi := Tbuku.listbuku[i].Jumlah_Buku ;
							Tbuku.listbuku[i].Jumlah_Buku := Tbuku.listbuku[j].Jumlah_Buku ;
							Tbuku.listbuku[j].Jumlah_Buku := tempi ;
							Tempi := Tbuku.listbuku[i].Tahun_Penerbit ;
							Tbuku.listbuku[i].Tahun_Penerbit := Tbuku.listbuku[j].Tahun_Penerbit ;
							Tbuku.listbuku[j].Tahun_Penerbit := tempi ;
							Temps := Tbuku.listbuku[i].Kategori ;
							Tbuku.listbuku[i].Kategori := Tbuku.listbuku[j].Kategori ;
							Tbuku.listbuku[j].Kategori := temps ;
				end;
			// Ketika judul buku yang satu lebih besar dari yang lain
			end else
			begin
				//inisialisasi
				k := 1 ;
				while (k <= length(Tbuku.listbuku[j].Judul_Buku)) and (stop=false) do
					begin
						// jika buku yang indexnya lebih kecil memiliki karakter pertama yang nilai ASCIInya lebih besar maka akan dilakukan swapping atau penukaran
						if (ord((Tbuku.listbuku[i].Judul_Buku)[k]) > ord((Tbuku.listbuku[j].Judul_Buku)[k])) then 
						begin
							// aksi penukaran
							Tempi := Tbuku.listbuku[i].ID_Buku ;
							Tbuku.listbuku[i].ID_Buku := Tbuku.listbuku[j].ID_Buku ;
							Tbuku.listbuku[j].ID_Buku := tempi ;
							Temps := Tbuku.listbuku[i].Judul_Buku ;
							Tbuku.listbuku[i].Judul_Buku := Tbuku.listbuku[j].Judul_Buku ;
							Tbuku.listbuku[j].Judul_Buku := temps ;
							Temps := Tbuku.listbuku[i].Author ;
							Tbuku.listbuku[i].Author := Tbuku.listbuku[j].Author ;
							Tbuku.listbuku[j].Author := temps ;
							Tempi := Tbuku.listbuku[i].Jumlah_Buku ;
							Tbuku.listbuku[i].Jumlah_Buku := Tbuku.listbuku[j].Jumlah_Buku ;
							Tbuku.listbuku[j].Jumlah_Buku := tempi ;
							Tempi := Tbuku.listbuku[i].Tahun_Penerbit ;
							Tbuku.listbuku[i].Tahun_Penerbit := Tbuku.listbuku[j].Tahun_Penerbit ;
							Tbuku.listbuku[j].Tahun_Penerbit := tempi ;
							Temps := Tbuku.listbuku[i].Kategori ;
							Tbuku.listbuku[i].Kategori := Tbuku.listbuku[j].Kategori ;
							Tbuku.listbuku[j].Kategori := temps ;
							stop := true ;
						// jika buku yang indexnya lebih kecil memiliki karakter pertama yang nilai ASCIInya lebih kecil maka tidak akan dilakukan swapping atau penukaran melainkan loop diberi sinyal untuk berhenti
						end else if (ord((Tbuku.listbuku[i].Judul_Buku)[k]) < ord((Tbuku.listbuku[j].Judul_Buku)[k])) and (ord((Tbuku.listbuku[i].Judul_Buku)[k]) <> ord((Tbuku.listbuku[k].Judul_Buku)[k]))  then
						begin
							// loop diberi sinyal untuk berhenti
							stop := true ;
						end ;
					// increment
					k := k + 1;
					end;
			end; 
		end;
	end;
end;

procedure caribukukategori (var Tbuku : List_Buku);
{prosedur untuk mencetak ke layar ID buku, nama buku, dan author buku untuk buku-buku yang sesuai dengan kategori inputan user} 
{Kamus Lokal}
var
	ikategori : string ;
	i : integer ;
	stop : Boolean ;
	count : integer ;
begin
	// inisialisasi
	stop := false ;
	count := 0 ;
	// skema validasi kategori inputan user
	repeat
	write('Masukkan kategori: ');
	readln(ikategori);
	if (ikategori = 'sastra') or (ikategori = 'sains') or (ikategori = 'manga') or (ikategori = 'sejarah') or (ikategori = 'programming') then
	begin
		writeln('Hasil pencarian:');
		stop := true ;
	end else // masukan user tidak valid
	begin
		writeln('Kategori ',ikategori,' tidak valid.');
	end;
	until(stop = True);
	// looping untuk mencari buku dengan kategori yang sesuai dengan inputan user
	for i := 1 to Tbuku.Neff do 
	begin 
		// analisis kasus
		if ((Tbuku.listbuku[i].kategori) = ikategori) then 
		begin
			// aksi yang dilakukan ketika kategori buku pada listbuku index ke-i sama dengan kategori yang diinginkan user
			writeln(Tbuku.listbuku[i].ID_Buku,' | ',Tbuku.listbuku[i].Judul_Buku,' | ',Tbuku.listbuku[i].Author);
			count := count + 1 ;
		end;
	end;
	// analisis kasus
	if (count = 0) then 
	begin 
		// aksi yang dilakukan ketika tidak ada buku yang kategorinya sesuai dengan kategori inputan user
		writeln('Tidak ada buku dalam kategori ini.')
	end;
end;
end.
	
