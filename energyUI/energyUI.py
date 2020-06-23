import pandas as pd
import plotly
import plotly.express as px
import plotly.graph_objects as go
from plotly.subplots import make_subplots
import sqlalchemy
from sqlalchemy import create_engine
import dash
import dash_core_components as dcc
import dash_html_components as html
from dash.dependencies import Input, Output, State

external_stylesheets = ['https://codepen.io/chriddyp/pen/bWLwgP.css']
app = dash.Dash(__name__, external_stylesheets=external_stylesheets)

#app = dash.Dash(__name__)

user = '*****'
password = '*****'
host = '*****'
port = '5432'
db = 'StageEnergyPricing'

#---------------------------------------------------------------

con = create_engine('postgresql://{}:{}@{}:{}/{}'.format(user, password, host, port, db))
query = "SELECT * FROM frontendtable"
df = pd.read_sql(query, con)
df['datetime'] = pd.to_datetime(df.datetime)
df.sort_values('datetime')

#---------------------------------------------------------------
# Input layout of Dash
app.layout = html.Div([

    html.Div([

        html.Br(),
        html.Label(['Choose:'],style={'font-weight': 'bold', "text-align": "center"}),
        dcc.Dropdown(id='iso',
            options=[{'label':x, 'value':x} for x in df.sort_values('iso')['iso'].unique()],
            value='SPP',
	    multi=False,
            disabled=False,
            clearable=True,
            searchable=True,
            placeholder='Choose Cuisine...',
            className='form-dropdown',
            style={'width':"90%"},
            persistence='string',
	    persistence_type='memory'),

        dcc.Dropdown(id='emszone',
            options=[{'label':x, 'value':x} for x in df.sort_values('emszone')['emszone'].unique()],
            value='ede',
            multi=False,
            clearable=False,
            persistence='string',
            persistence_type='session'),

        dcc.Dropdown(id='pricenodeloc',
            options=[{'label':x, 'value':x} for x in df.sort_values('pricenodeloc')['pricenodeloc'].unique()],
            value='EDEIATAN_EDUNJOU_RA',
            multi=False,
            clearable=False,
            persistence='string',
            persistence_type='local'),

    ]), #className='three columns'),


    html.Div([
        dcc.Graph(id='lmp_graph')
    ]),

    html.Div([
        dcc.Graph(id='load_graph')
    ]),

    html.Div([
        dcc.Graph(id='clouds_graph')
    ]),

    html.Div([
        dcc.Graph(id='wind_graph')
    ])

])

#---------------------------------------------------------------

@app.callback(
    Output('lmp_graph','figure'),
    [Input('iso','value'),
     Input('emszone','value'),
     Input('pricenodeloc','value')]
)

# LMP Graph
def build_graph(x, y, z):
    dff=df[(df['iso']==x) & (df['emszone']==y) & (df['pricenodeloc']==z)]
    dff=dff.sort_values('datetime')

    fig = px.line(dff, x="datetime", y="lmp", height=400)
    fig.update_layout(yaxis={'title':'LMP'},
                      title={'text':'LMP Prices',
                      'font':{'size':28},'x':0.5,'xanchor':'center'})
    return fig

@app.callback(
    Output('load_graph','figure'),
    [Input('iso','value'),
     Input('emszone','value'),
     Input('pricenodeloc','value')]
)

# Load Graph
def load_graph(x, y, z):
    dff=df[(df['iso']==x) & (df['emszone']==y) & (df['pricenodeloc']==z)]
    dff=dff.sort_values('datetime')

    fig = px.line(dff, x="datetime", y="load_cons", height=400)
    fig.update_layout(yaxis={'title':'Load'},
                      title={'text':'Load in MW',
                      'font':{'size':28},'x':0.5,'xanchor':'center'})
    return fig

@app.callback(
    Output('clouds_graph','figure'),
    [Input('iso','value'),
     Input('emszone','value'),
     Input('pricenodeloc','value')]
)

# Clouds Graph
def build_graph(x, y, z):
    dff=df[(df['iso']==x) & (df['emszone']==y) & (df['pricenodeloc']==z)]
    dff=dff.sort_values('datetime')

    fig = px.line(dff, x="datetime", y="clouds", height=400)
    fig.update_layout(yaxis={'title':'% Coverage'},
                      title={'text':'Cloud Cover %',
                      'font':{'size':28},'x':0.5,'xanchor':'center'})
    return fig

@app.callback(
    Output('wind_graph','figure'),
    [Input('iso','value'),
     Input('emszone','value'),
     Input('pricenodeloc','value')]
)

# Wind Speed Graph
def build_graph(x, y, z):
    dff=df[(df['iso']==x) & (df['emszone']==y) & (df['pricenodeloc']==z)]
    dff=dff.sort_values('datetime')

    fig = px.line(dff, x="datetime", y="windspeed", height=400)
    fig.update_layout(yaxis={'title':'Wind Speed'},
                      title={'text':'Wind Speed',
                      'font':{'size':28},'x':0.5,'xanchor':'center'})
    return fig

#---------------------------------------------------------------

if __name__ == '__main__':
    app.run_server(debug=True, host='*****', port=80)
