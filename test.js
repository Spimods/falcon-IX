const { Client, Intents } = require('discord.js');
const mysql = require('mysql');

const db_config = {
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'ctf'
};

const db_conn = mysql.createConnection(db_config);

function checkDbConnection() {
    if (!db_conn._connectCalled) {
        db_conn.connect();
    }
}

function fetchTopScores() {
    checkDbConnection();
    const query = 'SELECT * FROM python ORDER BY flag1 DESC, flag2 DESC, flag3 DESC, time_flag_1 ASC, time_flag_2 ASC, time_flag_3 ASC LIMIT 5';

    return new Promise((resolve, reject) => {
        db_conn.query(query, (error, results) => {
            if (error) {
                reject(error);
            } else {
                resolve(results);
            }
        });
    });
}

function closeDbConnection() {
    if (db_conn._connectCalled) {
        db_conn.end();
    }
}

function createEmbedWithImage() {
    // Code pour créer l'embed avec l'image
    const embed = new Discord.MessageEmbed()
        .setTitle("Top 5 Scores pour l'épreuve Python")
        .setColor('#00ff00')
        .setImage("attachment://classement_etape.png");

    return embed;
}

function saveClassementImage(rows) {
    // Code pour sauvegarder l'image
    const fs = require('fs');
    const { createCanvas, loadImage } = require('canvas');

    const canvas = createCanvas(width, height);
    const ctx = canvas.getContext('2d');

    // Code pour dessiner sur le canvas

    const buffer = canvas.toBuffer();
    fs.writeFileSync('classement_etape.png', buffer);
}

let lastMessageId = null;

const client = new Client({
    intents: [
        Intents.FLAGS.GUILDS,
        Intents.FLAGS.GUILD_MESSAGES,
        // Ajoutez d'autres intentions nécessaires en fonction de votre utilisation
    ]
});

client.once('ready', () => {
    console.log(`Bot prêt en tant que ${client.user.tag}`);
    sendTopScores.start();
});

const sendTopScores = new Client();
sendTopScores.setInterval(async () => {
    try {
        const channel = client.channels.cache.get('1187730540611252325'); // Remplacez par l'ID de votre canal

        if (channel) {
            const rows = await fetchTopScores();
            if (rows.length > 0) {
                saveClassementImage(rows);
                sendEmbedWithImage(channel);
            } else {
                channel.send('Aucun score trouvé dans la base de données.');
            }
        }
    } catch (error) {
        console.error(`Une erreur s'est produite : ${error}`);
    } finally {
        closeDbConnection();
    }
}, 60000); // 60000 millisecondes = 1 minute

async function sendEmbedWithImage(channel) {
    const embed = createEmbedWithImage();

    try {
        if (lastMessageId) {
            const previousMessage = await channel.messages.fetch(lastMessageId);
            await previousMessage.edit({ embed });
        } else {
            const message = await channel.send({ embed });
            lastMessageId = message.id;
        }

        await new Promise(resolve => setTimeout(resolve, 1000)); // Attendre 1 seconde
    } catch (error) {
        console.error(`Une erreur s'est produite lors de l'envoi de l'embed avec l'image : ${error}`);
    }
}

client.login('Token'); // Remplacez 'TOKEN' par le token de votre bot
//MTIwMTA5ODA2MjYxODE3NzU4OA.
//GVantz.fvj_-1O_B1yDg18alhq4izgTK9puhz92fkjFMU