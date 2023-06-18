from flask import Flask, request

app = Flask("WebServer") 


@app.route('/', methods=['GET'])
def web_server():
    if request.method == 'GET':
        return f"""
          <html>
          <head>
              <p>Hello World</p>
          </head>
          </html>
          """


if __name__ == '__main__':
    app.run(host="0.0.0.0", port=80, debug=True)
