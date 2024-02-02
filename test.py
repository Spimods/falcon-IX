import discord
from discord.ext import commands, tasks
from PIL import Image, ImageDraw, ImageFont
import io
import mysql.connector
import asyncio
import os  # Ajout de l'importation du module os

intents = discord.Intents.default()
intents.messages = True

bot = commands.Bot(command_prefix='!', intents=intents)

db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': '',
    'database': 'ctf'
}

db_conn = mysql.connector.connect(**db_config)

def check_db_connection():
    if not db_conn.is_connected():
        db_conn.connect()

def fetch_top_scores():
    check_db_connection()
    cursor = db_conn.cursor(dictionary=True)
    query = 'SELECT * FROM python ORDER BY flag1 DESC, flag2 DESC, flag3 DESC, time_flag_1 ASC, time_flag_2 ASC, time_flag_3 ASC LIMIT 5'
    cursor.execute(query)
    rows = cursor.fetchall()
    cursor.close()
    return rows

def close_db_connection():
    if db_conn.is_connected():
        db_conn.close()

def create_embed_with_image():
    # Utilisation d'un chemin absolu pour l'image
    image_path = os.path.abspath("classement_etape.png")

    with open(image_path, "rb") as file:
        image_data = file.read()

    embed = discord.Embed(title="Top 5 Scores pour l'épreuve Python", color=0x00ff00)
    file = discord.File(io.BytesIO(image_data), f"classement_etape.png")
    embed.set_image(url=f"attachment://{image_path}")

    return embed

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

bot.run('MTIwMTA5ODA2MjYxODE3NzU4OA.GwBlrn.0e0b40LKBTEz_lk024lAGlApCjZuPzTlp3l-KY')
