let fs = require('fs');

function renameimgur() {
    let files = fs.readdirSync('./i.imgur.com');

    let pngstart = Buffer.from([0x89, 0x50, 0x4e, 0x47]);
    console.log(pngstart.slice(0,4));

    for(let i of files) {
        let data = fs.readFileSync(`./i.imgur.com/${i}`);
        let ispng = pngstart.compare(data, 0, 4) == 0;
        if(ispng) {
            console.log(i);
            let newname = i.replace(".jpg",".png");
            fs.renameSync(`./i.imgur.com/${i}`, `./i.imgur.com/${newname}`);
        }
    }
}

let imgurfiles = fs.readdirSync('./i.imgur.com');
function fixupimgur(filename, outfile) {
    let data = fs.readFileSync(filename, {encoding: "UTF-8"});
    let result = data.replace(/src="https?:\/\/imgur.com\/([^"]+)"/g, (matched, g1)=> {
        let fn = imgurfiles.find(i => i.startsWith(g1));
        let res = `src="../../../i.imgur.com/${fn}"`;
        console.log(res);
        return res;
    });
    fs.writeFileSync(outfile, result)
}

//fixupimgur("./paydaymods.com/mods/index.html", "./paydaymods.com/mods/index-3.html");

let fns = ['paydaymods.com/mods/102/KPR.html',
    'paydaymods.com/mods/138/MWS.html',
    'paydaymods.com/mods/142/ADS_FM.html',
    'paydaymods.com/mods/149/lmgsights.html',
    'paydaymods.com/mods/154/mmenustreamline.html',
    'paydaymods.com/mods/164/techrework.html',
    'paydaymods.com/mods/191/TMBGUI.html',
    'paydaymods.com/mods/201/waypointtweaks.html',
    'paydaymods.com/mods/216/createemptylobby.html',
    'paydaymods.com/mods/218/bmarketweapcustrevert.html',
    'paydaymods.com/mods/223/ICAPS.html',
    'paydaymods.com/mods/224/loadingscreeninfo.html',
    'paydaymods.com/mods/248/fpscap.html',
    'paydaymods.com/mods/270/ABAP.html',
    'paydaymods.com/mods/277/stalelobbycontractfix.html',
    'paydaymods.com/mods/286/gensec_shotgunners.html',
    'paydaymods.com/mods/287/additionalpocohudtrackers.html',
    'paydaymods.com/mods/312/Extra.html',
    'paydaymods.com/mods/370/blackmarketpersistentnames.html',
    'paydaymods.com/mods/376/throwablesinteamloadout.html',
    'paydaymods.com/mods/404/uppersfakcontours.html',
    'paydaymods.com/mods/405/bulletstormammobagcontours.html',
    'paydaymods.com/mods/41/LPI.html',
    'paydaymods.com/mods/416/stopyelling.html',
    'paydaymods.com/mods/417/twoclicksafehouse.html',
    'paydaymods.com/mods/42/ENH_HMRK.html',
    'paydaymods.com/mods/439/KIC.html',
    'paydaymods.com/mods/44/arm_mui.html',
    'paydaymods.com/mods/504/fhb.html',
    'paydaymods.com/mods/526/CLC.html',
    'paydaymods.com/mods/535/LS.html',
    'paydaymods.com/mods/541/IGWSC.html',
    'paydaymods.com/mods/543/VoidUI.html',
    'paydaymods.com/mods/547/adaptivestreamingchunksize.html',
    'paydaymods.com/mods/551/mll.html',
    'paydaymods.com/mods/567/SHD.html',
    'paydaymods.com/mods/581/MKP.html',
    'paydaymods.com/mods/60/SDJBL.html',
    'paydaymods.com/mods/641/MCbC.html',
    'paydaymods.com/mods/644/OSNIA.html',
    'paydaymods.com/mods/646/cds.html',
    'paydaymods.com/mods/647/MRK.html',
    'paydaymods.com/mods/65/BDB.html',
    'paydaymods.com/mods/662/CTC.html',
    'paydaymods.com/mods/663/AM.html',
    'paydaymods.com/mods/73/RTR.html',
    'paydaymods.com/mods/81/FSS.html',
    'paydaymods.com/mods/89/FC.html'
 ];
 for(let i of fns) {
     fixupimgur(i,i);
 }