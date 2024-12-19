# Blogging Application <TS/NextJS>

## Overview 
<p>

This application leverages MindsDB to deliver intelligent chat assistance. Users can view all posts, like their favorites, and create new posts. The app uses token-based authentication to ensure secure access and interactions. Additionally, users have the ability to report posts, helping to maintain content quality and compliance with community standards.

</p>

---
## ✨ Features
- Create a post
- Report a post
- It has ai assistance using which we can quickly get quick assistance in articulating our posts.
- Like a post
- Segmentation is happening on the backend frontend implementation is yet to be done
- Follow author
- Authentication and Authorization is enabled.Users with admin right have privileged rights(this still needs a fix).

## Tech Stack

- **Frontend:** NextJs, Tailwind CSS
- **Backend:** Next Js
- **Database:** Postgres DB
  
## 🚀 Getting Started  

### Open Using Daytona  

1. **Install Daytona**: Follow the [Daytona installation guide](https://www.daytona.io/docs/installation/installation/).  
2. **Create the Workspace**:  
   ```bash  
   daytona create https://github.com/daytonaio/sample-nextjs-blogging-app
   ```  
3. **Create an .env folder in your root level of application by following env.sample**

   ```
   DATABASE_URL=<postgresdburl>
   SECRET_KEY=<secretkey>
   MINDSDB_KEY=<mindsdbapikey>
   BASE_URL=http://localhost:3000
   MINDS_URL=http://localhost:47334
   ```
   To know how to get the mindsdb_key, refer to this blog: [https://dev.to/niharikaa/mindsdb-integrate-aiml-models-into- 
   your-applications-4oc7](https://dev.to/niharikaa/mindsdb-integrate-aiml-models-into- 
   your-applications-4oc7)
   To get the database_url quickly, go to Aiven and get a PostgreSQL DB instance. [aiven.io](https://aiven.io/)


4. **Start the Application**:  
   ```bash  
      npm run dev
   ```  


5. **You can see that on port 47334 minds db editor is running,just run these models by going /editor route**
   ```sql
   CREATE ML_ENGINE minds_endpoint_engine
   FROM minds_endpoint
   USING
   minds_endpoint_api_key = 'ebcb57d05ebccdbcd2e75901902f7d2b8254c2a57f474c5e255117f69286a8cc';
   CREATE MODEL blog_helper
   PREDICT output
   USING
   engine = 'minds_endpoint_engine',
   max_tokens = 800,
   model_name = 'mistral-7b',
   prompt_template = 'You are an AI-powered data retrieval assistant. I will provide you with a query about a specific topic. Your task is to retrieve relevant information 
   and provide a detailed, accurate, and informative response. The response should be structured as follows:

    - **Topic Overview**: A brief overview of the topic.
    - **Details**: Detailed information related to the query.
    - **Sources**: Any sources or references where the information can be verified.

    Ensure that the response is informative and comprehensive, formatted using Markdown.

    Here is the query:

    {{query}}

    ';

     CREATE MODEL topic_classifier_model
    PREDICT topic
    USING
    engine = 'minds_endpoint_engine',
    prompt_template = '
    Classify the given review into one of the following topics:
    Software Engineering, Machine Learning, Art, Photography, Dance, Culinary, Data Science, Cybersecurity, Astronomy, Physics, Chemistry, Biology, Mathematics, 
    Philosophy, Psychology, History, Geography, Literature, Linguistics, Political Science, Economics, Environmental Science, Sociology, Anthropology, Archaeology, 
    Engineering, Robotics, Artificial Intelligence, Game Development, Web Development, Mobile App Development, Blockchain Technology, Quantum Computing, Music, Theater, 
   Film Studies, Graphic Design, Interior Design, Fashion Design, Architecture, Ecology, Genetics, Marine Biology, Astronautics, Neuroscience, Immunology, Forensic 
   Science, Biotechnology, Agriculture, Veterinary Science, Renewable Energy, Urban Planning, Transportation Engineering, Material Science, Sports Science, Education, 
   Psychiatry, Public Health, Human Resources, Marketing, Journalism, Creative Writing, Comedy, Television Production, Animation, Sound Engineering, Tourism, Hospitality 
   Management, Event Planning, Horticulture.
   The review is: "{{post}}"
   The topic is:';

    SELECT *
    FROM blog_helper  
    WHERE query = 'What is a Chip?';

   SELECT *
   FROM topic_classifier_model  
   WHERE post = 'Chromatin immunoprecipitation, or ChIP, is an antibody-based technology used to selectively enrich specific DNA-binding proteins along with their DNA 
   targets. ChIP is used to investigate a particular protein-DNA interaction, several protein-DNA interactions, or interactions across the whole genome or a subset of 
    genes.';
   
   ```
 ## Explanation of the Code

### **1. ML Engine Creation**

- Initializes an ML engine (`minds_endpoint_engine`) using the MindsDB API.
- The engine connects via an API key for secure communication.

### **2. `blog_helper` Model**

- A **chat assistant model** designed to generate detailed and structured responses.
- Key attributes:
  - Uses the `mistral-7b` AI model.
  - Processes user queries with a specific **prompt template**.
  - Outputs responses formatted in Markdown, including:
    - **Topic Overview**
    - **Detailed Information**
    - **Sources**

### **3. `topic_classifier_model`**

- A **classification model** for assigning input text to one of 60+ predefined categories.
- Categories include fields like:
  - Software Engineering, Machine Learning, Biology, Cybersecurity, Music, Psychology, etc.
- Operates using a prompt to analyze and classify input text.

### **4. Querying Models**

- **`blog_helper`**:  
  Processes queries like “What is a Chip?” and returns:
  - A **topic overview**, **detailed explanation**, and **sources** in Markdown format.

- **`topic_classifier_model`**:  
  Classifies text, such as reviews or scientific descriptions, into relevant topics like “Biology” or “Machine Learning.”

6. **Now you are good to go🚀**


## Preview

![image](https://github.com/user-attachments/assets/8a218ef7-b3b4-47d4-a599-a782d07cf817)
![image](https://github.com/user-attachments/assets/c8f21fc6-d80a-468e-b9c3-f04d3e70cc5f)
![image](https://github.com/user-attachments/assets/d273de7c-65f7-471b-8642-18150c22c2fe)
![image](https://github.com/user-attachments/assets/8d14bf91-aae2-4085-a543-445dff7eb37c)
![image](https://github.com/user-attachments/assets/a3921046-34af-49f3-af56-59c16b16a08b)
[Watch my Loom video](https://www.loom.com/share/999e9aaeb32940739632c095bdcb16aa?sid=c76806a1-f328-498f-9986-889378fb2568)





