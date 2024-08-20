# PECAN-stack Boilerplate

This repository serves as boilerplate for a full-stack application using the PECAN stack (PostgreSQL + Express + Coolify/Cloudflare + Angular + Node.js).
<table>
  <tr>
    <td width="70%"><img src="https://github.com/user-attachments/assets/1ee85fcd-c0e5-433d-9307-f92a496cdd6a" alt="Screenshot 2024-08-02 at 9 48 15 PM" width="100%"></td>
    <td width="30%"><img src="https://github.com/user-attachments/assets/366b0af4-7ad7-4adc-9b95-2018f6eb7c37" alt="Screenshot 2024-08-02 at 9 48 57 PM" width="100%"></td>
  </tr>
</table>

<table>
  <tr>
    <td width="70%"><img src="https://github.com/user-attachments/assets/9abfdbdf-1562-4a7b-8b30-c0e30a54c53a" alt="Screenshot 2024-08-02 at 9 49 53 PM" width="100%"></td>
    <td width="30%"><img src="https://github.com/user-attachments/assets/e1ec6375-2cda-41dc-ac7c-9f463075ff85" alt="Screenshot 2024-08-02 at 9 49 38 PM" width="100%"></td>
  </tr>
</table>

# Running Locally
- Create a `.env` file following `.env.example`
- Run `npm install --legacy-peer-deps`
- Run `docker-compose up --build` (make sure you have Docker installed)
- Visit localhost:4000

# Theme
This project uses the [NG-ZORRO](https://ng.ant.design/docs/introduce/en) component library. You can toggle the theme in angular.json.

Light Mode:
```json
  "styles": [
              "node_modules/ng-zorro-antd/ng-zorro-antd.less",
              "src/styles.less"
            ],
```

Dark Mode:
```json
  "styles": [
              "node_modules/ng-zorro-antd/ng-zorro-antd.dark.less",
              "src/styles.less"
            ],
```
