# Project Overview

## Introduction

This project is an AI-powered healthcare platform designed to automate patient interactions, manage appointments, and provide relevant healthcare information. The system leverages modern technologies to create a robust and efficient service that integrates both real-time and traditional web protocols to deliver a seamless user experience.

## Architecture

The architecture is built on a microservices approach, ensuring scalability, modularity, and ease of maintenance. The system consists of the following key components:

1. **Frontend**: Build with swift using SwiftUI to create a modern and responsive user interface for patients and healthcare providers.
2. **Backend**: .NET core with Golang and Python for the AI assistant, providing a high-performance, scalable backend for data processing and interaction management.
3. **Database**: Microsoft SQL Server (MSSQL) for reliable, high-performance data management.
4. **Communication Protocols**: WebRTC for real-time communication (audio/video calls) and HTTP for RESTful API business interactions.

### High-Level Architecture Diagram

<!-- link to diagram -->
<!-- local file jpeg -->

![Alt text](images/arch.png)

# Technological Stack

1. **IOS Mobile APP**

   • Why? React.js offers a robust framework for building dynamic user interfaces with reusable components, making it ideal for complex, responsive applications like healthcare platforms.

2. **Backend: Node.js and Express.js**

   • Why? Node.js allows for a high-performance, scalable backend with non-blocking I/O operations, ideal for handling real-time interactions. Express.js provides a lightweight framework to build APIs and manage routes efficiently.

3. **Database: Microsoft SQL Server (MSSQL)**

   • Why MSSQL?
   • Scalability: MSSQL supports large-scale applications with complex transactions, making it a perfect choice for healthcare systems with high data volume.
   • Performance: It offers optimized performance with advanced query processing, in-memory capabilities, and enhanced transaction handling.
   • Security: MSSQL provides robust security features such as data encryption, advanced threat detection, and compliance with industry standards, which are crucial in healthcare.
   • Integration: Easy integration with other Microsoft tools and services, enhancing the overall productivity and maintenance of the system.

4. **Communication Protocols**

   • WebRTC: Used for real-time communication like video and voice calls between patients and healthcare providers. WebRTC offers low-latency connections directly between browsers, enhancing user experience during interactions.
   • HTTP/HTTPS: Used for traditional RESTful API communication between the frontend and backend, ensuring reliable data transmission and access to user information.

# AI Assistant

The AI Assistant is a key component of the system, providing seamless interaction between users and the healthcare call center. It combines state-of-the-art technologies to deliver an intelligent and efficient conversational experience.

Key Features:

**Speech-to-Text (STT):** Converts user speech into text using advanced speech recognition models. This allows users to interact naturally with the system without needing to type.

**Large Language Model (LLM):** Processes and understands the transcribed text, generating intelligent and contextually relevant responses based on the user’s queries. The LLM is fine-tuned for healthcare-related interactions, ensuring accurate and helpful responses.

**Text-to-Speech (TTS):** Converts the generated text responses back into speech, providing a human-like voice output. This enhances the overall user experience by allowing a conversational flow.

**Low Latency**: The entire process from `STT` to `LLM` processing and TTS generation has a total latency of under `500 milliseconds`. This low latency ensures near real-time interactions, making conversations smooth and responsive.

Technological Advantages:

**Accuracy**: By combining high-quality `STT` and `TTS` models with an LLM, the assistant provides precise and relevant responses, enhancing patient satisfaction.
Available Languages:

```plaintext
• English
• Spanish
• French
• German
• Italian
• Uzbek
• Russian
```

**Scalability**: Designed to handle numerous concurrent users, `3000+` concurret meetings on a single server, the assistant can scale horizontally to accommodate growing user demands.

**Security and Compliance**: The assistant adheres to healthcare industry standards, ensuring data privacy and security throughout the interaction.

```plaintext
Protocol       | Average Latency (ms)
--------------------------------------
WebRTC         |    50-150 ms
WebSockets     |    200-300 ms
VoIP           |    250-400 ms
HTTP           |   500-1000 ms
```
