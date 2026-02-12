# 🧩 Custom Avatar Widget with Initials Fallback

**Weekly FlutterFlow Custom Code — Week 3** by [Brani](https://github.com/rapivio) | Rapivio

A production-ready avatar widget that displays a profile image when available and gracefully falls back to styled initials — just like Google, Slack, and Microsoft Teams.

![FlutterFlow Compatible](https://img.shields.io/badge/FlutterFlow-Compatible-4B39EF)
![Dart](https://img.shields.io/badge/Dart-3.x-blue)
![License](https://img.shields.io/badge/License-MIT-green)

---

## ✨ Features

- 🖼️ **Image with fallback** — Shows profile photo or auto-generated initials
- 🎨 **Deterministic colors** — Same name always gets the same background color
- ⚡ **Optional fade-in** — Smooth image animation, off by default
- 🛡️ **Error resilient** — Broken image URLs automatically fall back to initials
- ⭕ **Circular or rounded** — Supports both shapes via parameters
- 🎯 **Fully configurable** — Size, colors, border, font weight, radius
- 🔗 **FlutterFlow friendly** — Separate `firstName` + `lastName` params match typical data models

## 📸 Preview

<img width="131" height="132" alt="image" src="https://github.com/user-attachments/assets/63182241-0007-4ac4-86a3-34cd89036186" />
<img width="117" height="118" alt="image" src="https://github.com/user-attachments/assets/9cf7ab06-1c53-4820-bd3f-10a75ff6d3c8" />
<img width="71" height="69" alt="image" src="https://github.com/user-attachments/assets/648f935d-bbed-4c85-a14a-71093961fd87" />


## 🔧 FlutterFlow Setup

1. Go to **Custom Code** → **Custom Widgets** → **+ Create**
2. Name it `CustomAvatar`
3. Set width & height to `48` (or your preferred default)
4. Add the following parameters:

| Parameter | Type | Required | Default |
|-----------|------|----------|---------|
| `firstName` | `String` | ✅ Yes | — |
| `lastName` | `String` | No | — |
| `imageUrl` | `String` | No | — |
| `size` | `double` | No | — |
| `isCircular` | `bool` | No | — |
| `enableAnimation` | `bool` | No | — |
| `borderRadius` | `double` | No | — |
| `borderColor` | `Color` | No | — |
| `borderWidth` | `double` | No | — |
| `fontSize` | `double` | No | — |
| `fontWeight` | `int` | No | — |
| `textColor` | `Color` | No | — |
| `backgroundColor` | `Color` | No | — |

5. Paste the code from [custom_avatar.dart](custom_avatar.dart)
6. Compile & use! 🎉

## 💡 Usage Examples

### Basic — Just a first name
```
CustomAvatar(firstName: "Brani")
// → Shows "B" with a deterministic background color
```

### With last name
```
CustomAvatar(
  firstName: "Brani",
  lastName: "Mueller",
)
// → Shows "BM" with a deterministic background color
```

### With profile image
```
CustomAvatar(
  firstName: "Brani",
  lastName: "Mueller",
  imageUrl: "https://example.com/avatar.jpg",
)
// → Shows image, falls back to "BM" if image fails
```

### Large rounded rectangle with border & animation
```
CustomAvatar(
  firstName: "Jane",
  lastName: "Doe",
  size: 80,
  isCircular: false,
  borderRadius: 16,
  borderColor: Color(0xFFE0E0E0),
  borderWidth: 2,
  enableAnimation: true,
)
```

## 🎨 Color Palette

The widget includes 16 curated colors that are automatically assigned based on the user's name. The same name always produces the same color — no randomness.

## 📂 Series

| Week | Widget | Link |
|------|--------|------|
| 1 | Text Truncation Function | [→ Repo](#) |
| 2 | Dotted Border Container | [→ Repo](#) |
| **3** | **Custom Avatar with Initials** | **This repo** |

---

## 📄 License

MIT — Use it freely in your FlutterFlow projects!

---

**Found this useful?** ⭐ Star the repo and follow for weekly FlutterFlow custom code!

**Found this useful?** ⭐ Star the repo and follow for weekly FlutterFlow custom code!
