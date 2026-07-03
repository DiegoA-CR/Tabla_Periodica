from flask import Flask, jsonify,request ,render_template;
import psycopg2;
import psycopg2.extras;

app = Flask(__name__)


# Configuración de la base de datos
DB_CONFIG = {
    'host': 'localhost',
    'database': 'TABLA_ELEMENTOS',
    'user': 'postgres',
    'password': '1234'
}

def get_db_connection():
    """Establece conexión con PostgreSQL"""
    conn = psycopg2.connect(**DB_CONFIG)
    conn.cursor_factory = psycopg2.extras.RealDictCursor  # Para obtener diccionarios
    return conn

#Ruta Principal -- Sirve el HTML
@app.route('/')
def index():
    return render_template('index.html')

#------------------------------------------------------
#@app.route("/")
#def hello_world():
#    return "¡Hola Mundo desde Flask en Ubuntu!"
#------------------------------------------------------


@app.route('/api/elementos')
def get_elementos():
    try:
        conn = get_db_connection()
        cur = conn.cursor()

        cur.execute("""
            SELECT
                    e.numero_atomico,
                    e.simbolo,
                    e.nombre,
                    e.masa_atomica,
                    e.periodo,
                    e.grupo,
                    c.nombre as categoria,
                    es.nombre as estado,
                    b.letra as bloque
            FROM elementos e
            JOIN categorias c ON e.categoria_id = c.id
            JOIN estados es ON E.estado_id = es.id
            JOIN bloques b ON e.bloque_id = b.id
            ORDER BY e.numero_atomico        
            """)
        
        elementos = cur.fetchall()
        cur.close()
        conn.close()

        return jsonify(elementos)
    
    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True, port=4000)