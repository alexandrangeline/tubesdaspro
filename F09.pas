Unit F09;

interface
    uses typelist;
    procedure tambah_buku (var Tbuku:List_Buku);
    { Prosedur ini menerima inputan berupa buku (id, judul, pengarang, jumlah, tahun terbit, 
    dan kategori buku), dan menambahkan buku tersebut ke sistem perpustakaan. 
    Prosedur ini hanya bisa diakses oleh admin. }

implementation
    procedure tambah_buku (var Tbuku:List_Buku);
    { Prosedur ini menerima inputan berupa buku (id, judul, pengarang, jumlah, tahun terbit, 
    dan kategori buku), dan menambahkan buku tersebut ke sistem perpustakaan. 
    Prosedur ini hanya bisa diakses oleh admin. }

    // KAMUS LOKAL 
    var
        id,jumlah,tahun:integer;
        judul,penulis,kategori:string;

    // ALGORITMA 
    begin   
    // Input dari User
    writeln('Masukkan Informasi buku yang ditambahkan:');
    write('Masukkan id buku: ');
    readln(id);
    write('Masukkan judul buku: ');
    readln(judul);
    write('Masukkan pengarang buku: ');
    readln(penulis);
    write('Masukkan jumlah buku: ');
    readln(jumlah);
    write('Masukkan tahun terbit buku: ');
    readln(tahun);
    write('Masukkan kategori buku: ');
    readln(kategori);
    writeln('');
    writeln('Buku berhasil ditambahkan ke dalam sistem!');

    // Memasukkan input dari user ke array List Buku 
    Tbuku.Neff:=Tbuku.Neff+1;
    Tbuku.listbuku[Tbuku.Neff].ID_Buku:=id;
    Tbuku.listbuku[Tbuku.Neff].Judul_Buku:=judul;
    Tbuku.listbuku[Tbuku.Neff].Author:=penulis;
    Tbuku.listbuku[Tbuku.Neff].Jumlah_Buku:=jumlah;
    Tbuku.listbuku[Tbuku.Neff].Tahun_Penerbit:=tahun;
    Tbuku.listbuku[Tbuku.Neff].Kategori:=kategori;
    end;
end.