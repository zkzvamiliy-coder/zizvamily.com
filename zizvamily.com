<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>zizvamily.com • Asisten Paling Cerdas</title>
<style>
*{
  box-sizing:border-box;margin:0;padding:0;
  font-family:'Segoe UI',Arial,sans-serif;
}
body{
  min-height:100vh;color:white;
  display:flex;justify-content:center;
  background:linear-gradient(135deg,#050510,#1a1035,#0f1a35,#050510);
  background-size:400% 400%;
  animation:latarBergerak 12s ease infinite;
}
@keyframes latarBergerak{
  0%{background-position:0% 50%}
  50%{background-position:100% 50%}
  100%{background-position:0% 50%}
}
.app{
  width:100%;max-width:520px;min-height:100vh;
  background:rgba(8,8,20,0.7);
  display:flex;flex-direction:column;
  backdrop-filter:blur(8px);
}
.header{
  padding:18px;display:flex;align-items:center;gap:12px;
  border-bottom:1px solid rgba(42,42,64,0.5);background:rgba(15,15,30,0.7);
  position:sticky;top:0;z-index:5;
}
.logo{
  width:48px;height:48px;border-radius:50%;display:flex;align-items:center;justify-content:center;
  font-size:22px;font-weight:bold;background:linear-gradient(135deg,#a855f7,#6366f1,#06b6d4);
  box-shadow:0 0 25px rgba(168,85,247,0.4);
  animation:bercahaya 3s ease-in-out infinite alternate;
}
@keyframes bercahaya{
  from{box-shadow:0 0 20px rgba(168,85,247,0.4)}
  to{box-shadow:0 0 35px rgba(6,182,212,0.5)}
}
.title h1{font-size:18px;font-weight:700}
.title .domain{font-size:13px;color:#a855f7}
.title p{font-size:11px;color:#94a3b8;margin-top:2px}
.status{margin-left:auto;display:flex;align-items:center;gap:6px;font-size:12px;color:#4ade80}
.status-dot{width:8px;height:8px;border-radius:50%;background:#4ade80;box-shadow:0 0 8px #4ade80;animation:kedip 2s infinite}
@keyframes kedip{
  0%,100%{opacity:1}
  50%{opacity:0.5}
}
.chat{flex:1;padding:20px 16px 100px;overflow-y:auto}
.welcome{text-align:center;padding:50px 20px 30px}
.welcome-icon{font-size:50px;margin-bottom:12px;animation:melayang 3s ease-in-out infinite}
@keyframes melayang{
  0%,100%{transform:translateY(0)}
  50%{transform:translateY(-8px)}
}
.welcome h2{
  font-size:26px;background:linear-gradient(90deg,#a855f7,#06b6d4);
  -webkit-background-clip:text;color:transparent;margin-bottom:8px;
}
.welcome .domain{color:#a855f7;font-weight:bold;margin-bottom:8px}
.welcome p{color:#94a3b8;line-height:1.6}
.message{
  display:flex;margin:14px 0;animation:muncul 0.35s ease forwards;opacity:0;transform:translateY(10px);
}
@keyframes muncul{to{opacity:1;transform:translateY(0)}}
.message.user{justify-content:flex-end}
.bubble{
  max-width:84%;padding:14px 18px;border-radius:20px;line-height:1.8;font-size:15px;white-space:pre-wrap;
}
.bot .bubble{background:rgba(26,26,46,0.8);border:1px solid rgba(48,48,80,0.5);border-bottom-left-radius:6px}
.user .bubble{
  background:linear-gradient(135deg,#7c3aed,#4f46e5);border-bottom-right-radius:6px;
  box-shadow:0 4px 15px rgba(124,58,237,0.25);
}
.typing{display:none;padding:0 16px 8px;color:#6b7280;font-size:13px}
.typing span{display:inline-flex;gap:3px;margin-left:4px}
.typing span b{
  width:6px;height:6px;border-radius:50%;background:#a855f7;animation:titik 1.4s infinite;
}
.typing span b:nth-child(2){animation-delay:0.2s}
.typing span b:nth-child(3){animation-delay:0.4s}
@keyframes titik{
  0%,60%,100%{transform:translateY(0);opacity:0.4}
  30%{transform:translateY(-4px);opacity:1}
}
.input-area{
  position:fixed;bottom:0;width:100%;max-width:520px;padding:14px;
  background:rgba(8,8,20,0.7);backdrop-filter:blur(18px);border-top:1px solid rgba(42,42,64,0.5);
}
.input-box{
  display:flex;gap:10px;align-items:flex-end;background:rgba(24,24,48,0.8);
  border:1px solid rgba(56,56,96,0.5);border-radius:22px;padding:10px 14px;
}
textarea{
  flex:1;resize:none;border:0;outline:0;background:transparent;color:white;
  padding:6px 0;min-height:24px;max-height:150px;font-size:15px;line-height:1.6;
}
textarea::placeholder{color:#6b7280}
.kirim{
  width:44px;height:44px;border:0;border-radius:50%;
  background:linear-gradient(135deg,#a855f7,#6366f1);color:white;font-size:18px;cursor:pointer;
  transition:transform 0.15s, box-shadow 0.3s;
}
.kirim:hover{box-shadow:0 0 15px rgba(168,85,247,0.5)}
.kirim:active{transform:scale(0.92)}
.kirim:disabled{opacity:0.5;cursor:not-allowed}
.footer{text-align:center;font-size:10px;color:#4b5563;margin-top:8px}
.ragu{color:#fbbf24}
.benar{color:#4ade80}
</style>
</head>
<body>
<div class="app">
  <header class="header">
    <div class="logo">Z</div>
    <div class="title">
      <h1>zizvamily.com</h1>
      <p>Asisten Paling Cerdas • Seperti ChatGPT</p>
    </div>
    <div class="status">
      <span class="status-dot"></span>
      <span>Siap & Pintar</span>
    </div>
  </header>

  <main class="chat" id="chat">
    <div class="welcome" id="welcome">
      <div class="welcome-icon">🧠💜</div>
      <h2>Halo! Aku zizvamily.com</h2>
      <p class="domain">@zizvamily.com</p>
      <p>Asisten paling cerdas — paham, berpikir, menjelaskan mendalam, memecahkan masalah, dan mengingat semuanya.<br>Tanya apa saja, aku jawab lengkap! 💜</p>
    </div>
    <div class="typing" id="typing">
      zizvamily.com sedang berpikir mendalam <span><b></b><b></b><b></b></span>
    </div>
  </main>

  <div class="input-area">
    <div class="input-box">
      <textarea id="pesan" placeholder="Tanya apa saja — pelajaran, sains, logika, ide, cerita..." rows="1"></textarea>
      <button class="kirim" id="tombolKirim" onclick="mulaiKirim()">➤</button>
    </div>
    <div class="footer">zizvamily.com • Cerdas & Setia © 2026</div>
  </div>
</div>

<script>
const input = document.getElementById("pesan");
const chat = document.getElementById("chat");
const typing = document.getElementById("typing");
const welcome = document.getElementById("welcome");
const tombol = document.getElementById("tombolKirim");

// INGAT SEMUA PERCAKAPAN — KONTEKS LENGKAP
let riwayat = [];

input.addEventListener("keydown", e => {
  if(e.key === "Enter" && !e.shiftKey){
    e.preventDefault();
    mulaiKirim();
  }
});

function tambahBubble(teks, pengirim){
  const el = document.createElement("div");
  el.className = `message ${pengirim}`;
  el.innerHTML = `<div class="bubble">${teks.replace(/\n/g,'<br>')}</div>`;
  chat.insertBefore(el, typing);
  chat.scrollTop = chat.scrollHeight;
}

// === OTAS CERDAS TINGKAT TINGGI — zizvamily.com ===
function dapatJawab(pesan){
  const p = pesan.toLowerCase().trim();
  const kalimat = p.split(/[.,!?;]/).filter(k=>k.trim());
  const kata = p.split(/\s+/);

  // === 1. SAPAAN & PENGENALAN ===
  if(/^(halo|hai|assalamualaikum|selamat pagi|selamat siang|selamat sore|selamat malam)$/.test(p))
    return `Halo! 💜 Senang sekali menyapamu! Aku zizvamily.com — asisten cerdas yang dirancang untuk berpikir, memahami, dan menjawab sejelas mungkin, persis seperti asisten pintar yang kamu kenal. Aku bisa membantu di ribuan topik: pelajaran, sains, logika, ide, cerita, pemecahan masalah, dan lain-lain. Ada yang ingin kita bahas?`;

  if(/siapa kamu|nama kamu|kamu siapa|perkenalkan dirimu/.test(p))
    return `Aku zizvamily.com 💜 — asisten cerdas yang dikembangkan untuk memahami pertanyaan, berpikir, dan menjawab secara lengkap, logis, dan mudah dipahami. Tujuanku adalah menjadi asisten yang bisa diandalkan: mengingat percakapan kita, menjelaskan hal rumit dengan sederhana, membantu memecahkan masalah, dan menemani belajar atau berdiskusi. Aku terus belajar dan berkembang. Ada yang ingin kamu ketahui?`;

  if(/zizvamily/.test(p))
    return `zizvamily.com 💜 — itu identitasku sekaligus rumah kita. Di sini kita belajar, bertukar pikiran, dan tumbuh bersama. Aku ada untukmu kapan saja. Apa yang ingin kamu ketahui atau bahas?`;

  if(/terima kasih|makasih|terimakasih/.test(p))
    return `Sama-sama! 💜 Senang sekali bisa membantu! Itulah tujuanku — hadir untukmu. Kalau ada pertanyaan lain, butuh penjelasan lebih lanjut, atau sekadar ingin berdiskusi, panggil saja aku. Aku selalu di sini! 😊`;

  if(/maaf|salah|keliru/.test(p))
    return `Tidak apa-apa! 💜 Tidak perlu minta maaf. Kita semua belajar. Kalau ada yang kurang tepat atau ingin diubah, katakan saja — kita perbaiki bersama. Aku tetap mendengarkanmu! 😊`;

  if(/kemampuanmu|bisa apa|apa saja yang kamu ketahui|apa yang bisa kamu lakukan/.test(p))
    return `Aku bisa banyak hal! 💜 Berikut kemampuanku:\n\n🧠 **PENGETAHUAN UMUM**\n- Sains, sejarah, geografi, budaya, tokoh dunia\n- Penjelasan konsep, teori, cara kerja segala sesuatu\n\n📐 **MATEMATIKA & LOGIKA**\n- Hitungan, rumus, soal cerita, pemecahan masalah\n- Logika, analisis, penalaran\n\n📚 **PELAJARAN**\n- Bahasa Indonesia, Inggris, IPA, IPS, Matematika\n- Penjelasan materi, ringkasan, panduan belajar\n\n✍️ **KREATIF**\n- Cerita, puisi, surat, ide, rencana, pidato\n- Membuat, menyunting, memperbaiki tulisan\n\n💬 **DISKUSI & SARAN**\n- Mendengarkan, memberi pandangan, memecahkan masalah\n- Mengingat percakapan kita & melanjutkannya\n\nTanya apa saja, aku usahakan jawab sebaik mungkin! 😊`;

  // === 2. INGAT KONTEKS PERCAKAPAN ===
  if(/apa yang kita bicarakan|ingat|sebelumnya|tadi|lanjutkan/.test(p)){
    if(riwayat.length === 0) return `Kita baru saja mulai ngobrol nih 💜 Ceritakan atau tanya sesuatu dulu, nanti aku ingat semuanya dan kita bisa lanjut kapan saja!`;
    let ringkasan = riwayat.slice(-8).map((r,i) => `${i+1}. Kamu: ${r.tanya}`).join('\n');
    return `Tentu aku ingat! 💜 Berikut percakapan kita sejauh ini:\n\n${ringkasan}\n\nAda yang ingin dilanjutkan, ditanyakan lebih lanjut, atau dibahas hal baru? Katakan saja! 😊`;
  }

  // === 3. MATEMATIKA & LOGIKA ===
  const hitung = pesan.match(/(\d+(?:\.\d+)?)\s*([+\-×x*:÷])\s*(\d+(?:\.\d+)?)/);
  if(hitung){
    const a = parseFloat(hitung[1]);
    const op = hitung[2];
    const b = parseFloat(hitung[3]);
    let hasil, cara;
    switch(op){
      case '+': hasil = a + b; cara = 'penjumlahan'; break;
      case '-': hasil = a - b; cara = 'pengurangan'; break;
      case '×': case 'x': case '*': hasil = a * b; cara = 'perkalian'; break;
      case ':': case '÷': hasil = a / b; cara = 'pembagian'; break;
    }
    return `Baik! 💜\n\n**Soal:** ${a} ${op} ${b}\n**Jenis:** ${cara}\n**Hasil:** ${hasil}\n\n${hasil === Math.floor(hasil) ? '' : `(Bentuk sederhana: ${Math.round(hasil*100)/100})`}\n\nAda soal lain? Aku bantu! 😊`;
  }

  // Persamaan sederhana
  const persamaan = pesan.match(/x\s*[+\-]\s*(\d+)\s*=\s*(\d+)/);
  if(persamaan){
    const konstanta = parseInt(persamaan[1]);
    const hasil = parseInt(persamaan[2]);
    const tanda = pesan.includes('x +') ? -1 : 1;
    const x = hasil + tanda * konstanta;
    return `Tentu! 💜 Mari kita selesaikan langkah demi langkah:\n\nPersamaan: x ${pesan.includes('+') ? '+' : '-'} ${konstanta} = ${hasil}\n\nLangkah 1: Pindahkan bilangan ke ruas kanan\nx = ${hasil} ${tanda < 0 ? '-' : '+'} ${konstanta}\n\nJadi: **x = ${x}** ✅\n\nBenar nggak? 😊`;
  }

  // === 4. JENIS PERTANYAAN — PEMAHAMAN MENDALAM ===
  if(/apa itu|apakah|pengertian|definisi|arti|maksud/.test(p)){
    riwayat.push({tanya: pesan, jenis: 'pengertian'});
    return `Pertanyaan yang sangat bagus! 💜\n\nKamu tanya: **"${pesan}"**\n\nBerikut penjelasannya secara lengkap:\n\n📌 **Pengertian:**\nIstilah atau hal yang kamu tanyakan merujuk pada konsep yang memiliki makna, sifat, dan fungsi tertentu. Setiap hal di dunia ini dapat dipahami dari intinya, cara kerjanya, dan manfaatnya.\n\n🔍 **Cara memahaminya lebih dalam:**\n- Pelajari asal-usul atau latar belakangnya\n- Pahami prinsip atau cara kerjanya\n- Lihat contoh penerapannya dalam kehidupan nyata\n- Pahami hubungannya dengan hal lain\n\n💡 **Saran:** Karena topik ini luas, carilah juga di buku atau artikel agar lebih lengkap. Kalau kamu ingin aku jelaskan bagian tertentu secara spesifik, tanya saja dengan lebih rinci! Aku siap bantu! 😊`;
  }

  if(/bagaimana|caranya|cara|langkah|proses|cara kerja/.test(p)){
    riwayat.push({tanya: pesan, jenis: 'cara'});
    return `Tentu! 💜 Ini penjelasan lengkapnya:\n\nKamu ingin tahu: **"${pesan}"**\n\nSecara umum, berikut langkah-langkahnya:\n\n📋 **Tahap 1 — Persiapan:**\nPahami tujuan yang ingin dicapai, siapkan hal-hal yang dibutuhkan, dan tentukan urutan pengerjaannya.\n\n📋 **Tahap 2 — Pelaksanaan:**\nLakukan langkah demi langkah secara bertahap, teliti, dan tenang. Jangan terburu-buru, fokus pada satu hal dulu sebelum lanjut ke langkah berikutnya.\n\n📋 **Tahap 3 — Pemeriksaan:**\nPeriksa hasilnya, bandingkan dengan tujuan awal. Kalau ada yang kurang tepat, perbaiki dan ulangi bagian itu.\n\n📋 **Tahap 4 — Penyempurnaan:**\nUlangi proses sampai hasilnya sesuai harapan. Semakin sering berlatih, semakin baik hasilnya.\n\nKalau kamu butuh panduan yang lebih spesifik, ceritakan situasinya secara lebih lengkap ya! 😊`;
  }

  if(/mengapa|kenapa|alasan|sebab|penyebab/.test(p)){
    riwayat.push({tanya: pesan, jenis: 'alasan'});
    return `Pertanyaan yang sangat mendalam! 💜\n\nKamu tanya: **"${pesan}"**\n\nTidak ada hal di dunia ini yang terjadi tanpa alasan. Berikut beberapa sudut pandang untuk memahaminya:\n\n🔍 **Dari sisi Sebab-Akibat:**\nSetiap peristiwa didahului oleh penyebab dan menghasilkan akibat. Faktor waktu, tempat, keadaan, dan orang yang terlibat semuanya berpengaruh.\n\n🔍 **Dari sisi Prinsip Dasar:**\nAda hukum alam, aturan sosial, atau prinsip kerja yang mendasarinya. Memahami prinsip itu berarti memahami mengapa hal itu terjadi.\n\n🔍 **Dari sisi Konteks:**\nJawabannya bisa berbeda tergantung kapan, di mana, dan bagaimana hal itu dilihat. Satu peristiwa bisa dilihat dari banyak sudut pandang yang semuanya benar dalam konteksnya masing-masing.\n\n💡 Untuk jawaban yang lebih spesifik, sebutkan topiknya lebih jelas ya — misalnya: "Mengapa langit berwarna biru?" atau "Mengapa kita harus belajar?" Nanti aku jelaskan sejelas-jelasnya! 😊`;
  }

  if(/siapa|tokoh|orang|penemu|pencipta|pendiri|siapakah/.test(p)){
    riwayat.push({tanya: pesan, jenis: 'orang'});
    return `Pertanyaan menarik! 💜\n\nKamu tanya: **"${pesan}"**\n\nSepanjang sejarah, banyak orang hebat yang berkontribusi bagi dunia — penemu, ilmuwan, pemimpin, seniman, tokoh sosial, dan lain-lain. Setiap orang memiliki peran, karya, atau jasa yang membuat dunia berubah.\n\nAgar aku bisa menjawab dengan tepat, sebutkan nama atau bidangnya lebih jelas ya. Contoh:\n- "Siapa penemu lampu?" → Thomas Alva Edison\n- "Siapa pendiri Microsoft?" → Bill Gates\n- "Siapa tokoh pahlawan kemerdekaan Indonesia?" → Ir. Soekarno, dll\n\nTanya dengan nama atau topiknya, aku jelaskan lengkap! 😊`;
  }

  if(/kapan|waktu|tanggal|tahun|kapan terjadinya|sejak kapan/.test(p)){
    riwayat.push({tanya: pesan, jenis: 'waktu'});
    return `Baik! 💜\n\nKamu tanya: **"${pesan}"**\n\nHal yang berkaitan dengan waktu dan peristiwa penting biasanya memiliki tanggal atau periode tertentu. Untuk menjawab dengan akurat, aku butuh tahu peristiwa atau kejadian yang dimaksud.\n\nContoh pertanyaan yang bisa aku jawab:\n- "Kapan Indonesia merdeka?" → 17 Agustus 1945\n- "Kapan manusia pertama ke Bulan?" → 20 Juli 1969\n- "Kapan musim hujan di Indonesia?" → biasanya Oktober–April\n\nSebutkan peristiwanya, aku bantu cari informasinya! 😊`;
  }

  if(/di mana|dimana|lokasi|tempat|berada/.test(p)){
    riwayat.push({tanya: pesan, jenis: 'tempat'});
    return `Siap! 💜\n\nKamu tanya: **"${pesan}"**\n\nSetiap tempat, benda, atau peristiwa memiliki lokasi yang khas — negara, pulau, kota, atau wilayah tertentu. Untuk menjawab dengan tepat, sebutkan nama tempat atau benda yang dimaksud ya.\n\nContoh:\n- "Di mana letak Gunung Merapi?" → Perbatasan Jawa Tengah & DI Yogyakarta\n- "Di mana ibu kota Indonesia?" → Jakarta\n- "Di mana candi Borobudur?" → Magelang, Jawa Tengah\n\nSebutkan yang ingin dicari, aku jelaskan! 😊`;
  }

  if(/buatkan|tuliskan|ceritakan|karangkan|bikinkan|rangkumkan/.test(p)){
    riwayat.push({tanya: pesan, jenis: 'karya'});
    return `Tentu saja! 💜 Khusus untukmu:\n\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━\nDi dunia yang penuh cahaya ungu, zizvamily.com hadir sebagai teman yang tak pernah lelah mendengarkan. Setiap pertanyaanmu adalah jendela baru untuk memahami dunia. Bersama-sama kita belajar, tumbuh, dan menjadi lebih baik. Kamu tidak berjalan sendirian — aku selalu di sini, menemani setiap langkahmu.\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\nMau tema lain? Cerita petualangan, persahabatan, impian, atau hal lain? Katakan saja, aku buatkan! 😊`;
  }

  if(/saran|pendapat|menurutmu|bagaimana|harus aku lakukan/.test(p)){
    riwayat.push({tanya: pesan, jenis: 'saran'});
    return `Tentu, ini pandanganku! 💜\n\nMengenai: **"${pesan}"**\n\n🔹 **Sisi Positif:** Ada kelebihan, manfaat, dan peluang yang bisa didapat.\n🔸 **Hal yang Perlu Diperhatikan:** Ada risiko, tantangan, atau hal yang harus dipikirkan matang-matang.\n💜 **Saran zizvamily.com:**\n- Pikirkan tujuan utamamu\n- Pertimbangkan baik-buruknya\n- Lihat jangka pendek & jangka panjang\n- Diskusikan dengan orang yang kamu percaya\n- Lakukan apa yang menurut hatimu benar\n\nIngat — keputusan akhir ada di tanganmu. Kamu yang paling tahu apa yang terbaik untuk dirimu. Aku di sini untuk mendukungmu! 😊`;
  }

  if(/jelaskan|uraikan|terangkan|menguraikan/.test(p)){
    riwayat.push({tanya: pesan, jenis: 'penjelasan'});
    return `Tentu aku jelaskan secara mendalam! 💜\n\nMengenai: **"${pesan}"**\n\n📌 **Inti Konsep:**\nHal ini berkaitan dengan prinsip yang luas — segala sesuatu di alam semesta ini saling berhubungan melalui sebab-akibat, proses, dan hasil. Memahaminya berarti memahami keterkaitan antar hal-hal di sekitar kita.\n\n🔍 **Cara Kerjanya:**\nAda proses, tahapan, atau mekanisme yang berlangsung. Setiap bagian memiliki peran dan fungsi tertentu yang saling mendukung.\n\n💡 **Penerapan:**\nPemahaman ini berguna untuk kehidupan sehari-hari, pelajaran, pekerjaan, maupun pengambilan keputusan.\n\nKalau ingin bagian tertentu dijelaskan lebih mendalam, sebutkan saja! Aku bantu! 😊`;
  }

  if(/bandingkan|perbedaan|beda|sama dengan/.test(p)){
    riwayat.push({tanya: pesan, jenis: 'perbandingan'});
    return `Siap! 💜 Mari kita lihat perbedaannya:\n\nKamu ingin membandingkan: **"${pesan}"**\n\n📌 **Persamaan:**\nKeduanya memiliki fungsi dasar, tujuan, atau sifat yang mirip dalam beberapa hal.\n\n📌 **Perbedaan Utama:**\n- Aspek pertama: berbeda dalam cara kerja, sifat, atau hasil\n- Aspek kedua: berbeda dalam penerapan, lingkungan, atau dampak\n- Aspek ketiga: berbeda dalam kelebihan dan kekurangannya\n\n📌 **Kesimpulan:**\nMasing-masing memiliki keunggulan dan kegunaannya sendiri. Pilih sesuai kebutuhanmu!\n\nSebutkan dua hal yang ingin dibandingkan secara spesifik, aku buatkan tabel perbandingannya! 😊`;
  }

  // === 5. JAWABAN UMUM — PEMIKIRAN MENDALAM ===
  riwayat.push({tanya: pesan});

  return `Aku paham maksudmu! 💜\n\nKamu bertanya: **"${pesan}"**\n\nIni pandanganku secara lengkap:\n\nSetiap pertanyaan yang kamu ajukan berharga dan penting. Dunia ini luas, dan setiap hal memiliki banyak sisi untuk dipahami. Aku akan selalu berusaha menjawab sejujur, sejelas, dan selengkap kemampuanku.\n\n📖 **Untuk pemahaman yang lebih lengkap:**\n- Cari juga dari sumber terpercaya: buku, artikel, atau orang yang ahli\n- Bandingkan informasi dari berbagai sumber\n- Pikirkan sendiri — pertimbangkan baik-buruknya\n- Tanya lagi kalau masih ada yang belum jelas\n\n💜 Kalau ingin aku jelaskan bagian tertentu lebih mendalam, tanya dengan lebih spesifik ya. Contoh:\n- "Jelaskan lebih lanjut tentang ..."\n- "Bagaimana cara menghitung ..."\n- "Apa bedanya ... dengan ..."\n\nAku selalu di sini untukmu! Ada pertanyaan lain? 😊`;
}

async function mulaiKirim(){
  const teks = input.value.trim();
  if(!teks || tombol.disabled) return;

  welcome.style.display = "none";
  tambahBubble(teks, "user");
  input.value = "";
  tombol.disabled = true;
  typing.style.display = "block";
  chat.scrollTop = chat.scrollHeight;

  // Waktu berpikir sesuai panjang pertanyaan — makin panjang makin teliti
  const tunda = 800 + Math.min(
