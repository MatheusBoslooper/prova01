# Equipe

- Amanda Baggio Azevedo
- Matheus Henrique Boslooper  

---

# Tutorial Técnico - Componentes de Layout

Este documento descreve os principais componentes de layout utilizados nos dois protótipos desenvolvidos:

- Perfil de Artista    
- Calculadora de IMC  

---

## 1. Scaffold

**Descrição**:  
Estrutura base da interface, fornece um layout visual padrão com barra superior, corpo e outros elementos opcionais.

**Aplicacoes**:  
Presente em todos os protótipos como contêiner principal da interface.

**Como usar**:
```dart
Scaffold(
  appBar: AppBar(title: Text('Título')),
  body: Center(child: Text('Conteúdo')),
)
```

---

## 2. AppBar

**Descrição**:  
Barra superior com título, ícones de ação e controle de navegação.

**Aplicacoes**:  
Utilizado para dar identidade visual ao app e facilitar a navegação.

**Como usar**:
```dart
AppBar(
  title: Text('Título do App'),
)
```

---

## 3. Column

**Descrição**:  
Organiza widgets na vertical.

**Aplicacoes**:  
Utilizado nos dois protótipos para empilhar elementos como imagens, textos e botões.

**Como usar**:
```dart
Column(
  children: [
    Text('Exemplo'),
    Icon(Icons.star),
  ],
)
```

---

## 4. Row

**Descrição**:  
Organiza widgets horizontalmente.

**Aplicacoes**:  
Usado no Perfil de Artista para ícones de redes sociais.

**Como usar**:
```dart
Row(
  children: [
    Icon(Icons.star),
    Text('5.0'),
  ],
)
```

---

## 5. Text

**Descrição**:  
Exibe uma string com estilo personalizável.

**Aplicacoes**:  
Presente em todos os protótipos para exibir títulos, biografias, resultados, etc.

**Como usar**:
```dart
Text(
  'Texto de exemplo',
  style: TextStyle(fontSize: 18),
)
```

---

## 6. Image.asset / Image.network

**Descrição**:  
Exibe imagens locais ou da internet.

**Aplicacoes**:  
Utilizado no Perfil de Artista (foto do artista) e foto dos albuns.

**Como usar**:
```dart
Image.asset('assets/imagem.png')
Image.network('https://link-da-imagem.com')
```

---

## 7. ElevatedButton

**Descrição**:  
Botão elevado com destaque para ações principais.

**Aplicacoes**:  
Usado na Calculadora de IMC para disparar o cálculo e em interações gerais.

**Como usar**:
```dart
ElevatedButton(
  onPressed: () {},
  child: Text('Clique aqui'),
)
```

---

## 8. TextField

**Descrição**:  
Campo de entrada para o usuário digitar informações.

**Aplicacoes**:  
Usado na Calculadora de IMC para peso e altura.

**Como usar**:
```dart
TextField(
  controller: controller,
  decoration: InputDecoration(labelText: 'Digite algo'),
)
```

---

## 9. SingleChildScrollView

**Descrição**:  
Adiciona rolagem ao conteúdo da tela.

**Aplicacoes**:  
Usado nos protótipos com muitos elementos verticais, como o Perfil de Artista.

**Como usar**:
```dart
SingleChildScrollView(
  child: Column(children: [...]),
)
```

---

## 10. Card

**Descrição**:  
Contêiner com elevação e bordas arredondadas.

**Aplicacoes**:  
Utilizado para destacar seções no Perfil de Artista.

**Como usar**:
```dart
Card(
  child: Padding(
    padding: EdgeInsets.all(12.0),
    child: Text('Conteúdo'),
  ),
)
```

---

## 11. Icon

**Descrição**:  
Exibe um ícone vetorial da biblioteca de Material Icons.

**Aplicacoes**:  
Usado para redes sociais, avaliações e na interface geral dos apps.

**Como usar**:
```dart
Icon(Icons.star, color: Colors.amber)
```

---

## 12. Padding / EdgeInsets

**Descrição**:  
Adiciona espaçamento interno aos widgets.

**Aplicacoes**:  
Utilizado para espaçamento e alinhamento de componentes.

**Como usar**:
```dart
Padding(
  padding: EdgeInsets.all(16),
  child: Text('Texto'),
)
```

---

## 13. SizedBox

**Descrição**:  
Adiciona um espaço fixo entre widgets.

**Aplicacoes**:  
Usado amplamente para separação vertical e horizontal.

**Como usar**:
```dart
SizedBox(height: 20)
```

---

## 14. ThemeData & TextTheme

**Descrição**:  
Permite aplicar temas personalizados em toda a aplicação.

**Aplicacoes**:  
Usado para cores e estilos consistentes nos protótipos.

**Como usar**:
```dart
theme: ThemeData(
  textTheme: TextTheme(
    headlineMedium: TextStyle(fontSize: 24),
  ),
)
```

---



