# 📡 minitalk

A small client-server communication program written in **C** that uses **UNIX signals** to transmit messages between processes.

This project is part of the **42 School Common Core** and introduces inter-process communication (IPC) using only `SIGUSR1` and `SIGUSR2`.

---

# ✨ Features

- 📨 Send messages from a client to a server.
- 📡 Communication using only UNIX signals.
- 🔤 Supports sending complete strings.
- ⚡ Reliable bit-by-bit transmission.
- 🔄 Real-time communication between processes.
- ✅ Norm compliant.
- ✅ Tester passed.
- ✅ Clean memory management.

---

# 📂 Project Overview

The goal of **minitalk** is to build a simple communication system using UNIX signals.

Instead of sockets or pipes, every character is converted into binary and transmitted one bit at a time using:

- `SIGUSR1`
- `SIGUSR2`

The server reconstructs each character from the received bits and prints the original message to the terminal.

This project provides a solid introduction to:

- UNIX signals
- Inter-process communication (IPC)
- Bitwise operations
- Process IDs (PID)
- Signal handling
- Synchronization

---

# 📁 Project Structure

```
minitalk/
├── includes/
├── src/
│   ├── client.c
│   ├── server.c
│   ├── utils/
│   └── ...
├── libft/
├── Makefile
└── README.md
```

---

# ⚙️ How It Works

1. Start the server.
2. The server displays its Process ID (PID).
3. Launch the client with the server PID and a message.
4. The client converts every character into binary.
5. Each bit is sent using either `SIGUSR1` or `SIGUSR2`.
6. The server reconstructs every character and prints the received message.

---

# 🚀 Compilation

Clone the repository:

```bash
git clone https://github.com/Bavi2005/minitalk.git
cd minitalk
```

Compile the project:

```bash
make
```

---

# ▶️ Usage

Start the server:

```bash
./server
```

Example output:

```
Server PID: 12345
```

Open another terminal and run the client:

```bash
./client 12345 "Hello, World!"
```

Server output:

```
Hello, World!
```

---

# 🧠 Communication Protocol

Each character is represented using **8 bits**.

Example:

```
'A'

ASCII: 65

Binary:

01000001
```

Transmission:

```
0 → SIGUSR1
1 → SIGUSR2
```

The server receives the eight signals, reconstructs the character, and prints it.

This process repeats until the entire message has been transmitted.

---

# 📚 Allowed Functions

The project is implemented using only the functions allowed by the 42 subject, including:

- `signal`
- `sigaction`
- `kill`
- `pause`
- `usleep`
- `getpid`
- `write`
- `malloc`
- `free`

---

# 💡 Key Concepts Learned

During this project, I learned about:

- UNIX signals
- Client-server architecture
- Inter-process communication (IPC)
- Bitwise operations
- Binary encoding
- Signal synchronization
- Process management
- Writing robust C programs

---

# ✅ Project Status

- ✔️ Mandatory completed
- ✔️ Bonus completed *(if implemented)*
- ✔️ Norm compliant
- ✔️ Tester passed
- ✔️ No memory leaks

---

# 🎓 42 Project

This project is part of the **42 Common Core**.

Main concepts covered:

- UNIX Signals
- Process Communication
- Bit Manipulation
- Event-Driven Programming
- Low-Level System Programming

---

## 👨‍💻 Author

**Bavithran A/L Pichyalagan**

42 Kuala Lumpur

GitHub: https://github.com/Bavi2005

---

If you found this project useful or interesting, feel free to leave a ⭐ on the repository!
