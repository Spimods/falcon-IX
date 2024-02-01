import discord
from discord.ext import commands, tasks
from PIL import Image, ImageDraw, ImageFont
import io
import mysql.connector

intents = discord.Intents.default()
intents.messages = True

bot = commands.Bot(command_prefix='!', intents=intents)

# Configuration de la connexion à la base de données MySQL
db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': '',
    'database': 'ctf'
}

# Fonction pour vérifier et ouvrir la connexion à la base de données
def check_db_connection():
    if db_conn.is_connected():
        return
    else:
        db_conn.connect()

# Connexion à la base de données
db_conn = mysql.connector.connect(**db_config)

# Variable globale pour stocker l'ID du message envoyé
last_message_id = None

@bot.event
async def on_ready():
    print(f'Bot prêt en tant que {bot.user.name}')
    # Démarrer une tâche planifiée pour envoyer automatiquement les informations chaque minute
    send_top_scores.start()

@tasks.loop(minutes=1)  # Répète la tâche toutes les 1 minute
async def send_top_scores():
    global last_message_id

    channel_id = 1187730540611252325  # Remplacez cela par l'ID du salon où vous souhaitez envoyer les informations
    channel = bot.get_channel(channel_id)

    if channel:
        check_db_connection()  
        cursor = db_conn.cursor(dictionary=True)
        query = 'SELECT * FROM python ORDER BY flag1 DESC, flag2 DESC, flag3 DESC, time_flag_1 ASC, time_flag_2 ASC, time_flag_3 ASC LIMIT 5'
        cursor.execute(query)
        rows = cursor.fetchall()

        if rows:
            save_classement_image(rows)

            # Open the image file
            with open("classement_etape.png", "rb") as file:
                image = discord.File(io.BytesIO(file.read()), filename="classement_etape.png")

            # Create the Discord embed
            embed = discord.Embed(title="Top 5 Scores pour l'épreuve Python", color=0x00ff00)
            embed.set_image(url=f"attachment://classement_etape.png")

            # Retrieve the previous message and edit its content
            if last_message_id:
                previous_message = await channel.fetch_message(last_message_id)
                await previous_message.edit(embed=embed)

            else:
                # Send a new message with the image embedded
                message = await channel.send(embed=embed)
                last_message_id = message.id

        else:
            await channel.send("Aucun score trouvé dans la base de données.")

        cursor.close()

        # Fermer la connexion après avoir récupéré les données
        db_conn.close()

def save_classement_image(rows):
    background_image = Image.open("bgbot.png")
    width, height = background_image.size

    draw = ImageDraw.Draw(background_image)

    font_size = 19
    font = ImageFont.truetype("arialbd.ttf", font_size)

    x_place = 50
    x_nom = 150
    x_etape1 = 300
    x_etape2 = 450
    x_etape3 = 600

    y = 50
    marge_entre_personnes = 10

    draw.text((x_place, y - 30), "Place", font=font, fill="white")
    draw.text((x_nom, y - 30), " Nom", font=font, fill="white")
    draw.text((x_etape1, y - 30), "     Etape 1", font=font, fill="white")
    draw.text((x_etape2, y - 30), "   Etape 2", font=font, fill="white")
    draw.text((x_etape3, y - 30), "   Etape 3", font=font, fill="white")

    for i, row in enumerate(rows, start=1):
        y_position = y + i * (30 + marge_entre_personnes)
        draw.text((x_place, y_position), str(i), font=font, fill="white")
        draw.text((x_nom, y_position), row['nom'], font=font, fill="white")
        draw.text((x_etape1, y_position), row['time_flag_1'], font=font, fill="white")
        draw.text((x_etape2, y_position), row['time_flag_2'], font=font, fill="white")
        draw.text((x_etape3, y_position), row['time_flag_3'], font=font, fill="white")

    background_image.save("classement_etape.png")
    print("L'image du classement avec les étapes, une police plus grande, une marge de 10 pixels entre chaque personne, et fond personnalisé a été créée avec succès.")

bot.run('TOKEN')
