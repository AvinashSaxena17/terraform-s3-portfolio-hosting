
# Host Portfolio Website Using AWS S3 & Terraform



## 📌 Project Overview:

This project demonstrates how to host a static portfolio website on AWS S3 using Infrastructure as Code (IaC) with Terraform.
The solution automates the provisioning of AWS resources, ensuring repeatability and ease of deployment.

- [📌 Project Overview]
- [🔧 Prerequisites]
- [🧱 Step-by-Step Process]
- [ 🌍 Output ]
- [🧠 What I Learned]
- [📌 Future Improvements]






## 🔧 Prerequisites

- ✅ An AWS Account (Free Tier is enough)
- ✅ Terraform installed (terraform -version)
- ✅ Basic understanding of HTML/CSS (for customizing the portfolio)

## 🧱 Step-by-Step Process

### 🥇 1. Organized My portfolio Files such as HTML, CSS, JS etc.
1. I have an Index.html file.
2. Second organised CSS, JS files , fonts and images in a seperate folder.
3. All these became my upload source.
#
### ⚙️ 2. Created the Terraform Configuration (main.tf)

✅ Initializes Providers:

![App Screenshot](https://via.placeholder.com/468x300?text=App+Screenshot+Here)

✅ Configures AWS Provider:

![App Screenshot](https://via.placeholder.com/468x300?text=App+Screenshot+Here)

🪣 3. Created a Randomized S3 Bucket
-  To avoid name collisions and ensure uniqueness:

![App Screenshot](https://via.placeholder.com/468x300?text=App+Screenshot+Here)

🔐 4. Configured Ownership & Public Access
- To allow public read access to static files:

![App Screenshot](https://via.placeholder.com/468x300?text=App+Screenshot+Here)

![App Screenshot](https://via.placeholder.com/468x300?text=App+Screenshot+Here)

![App Screenshot](https://via.placeholder.com/468x300?text=App+Screenshot+Here)


🌐 5. Enabled Static Website Hosting

![App Screenshot](https://via.placeholder.com/468x300?text=App+Screenshot+Here)

📤 6. Uploaded All Files from DevFolio/

![App Screenshot](https://via.placeholder.com/468x300?text=App+Screenshot+Here)


📤 8. Output the Website URL (outputs.tf)

![App Screenshot](https://via.placeholder.com/468x300?text=App+Screenshot+Here)


🧪 Final Result

After running:
```
Terraform init

Terrafor apply -auto-approve
```

Terraform provisioned everything, uploaded my site, and gave me a live URL like:

```

```


## 🌍 Output:

![App Screenshot](https://via.placeholder.com/468x300?text=App+Screenshot+Here)


- 🎉 My portfolio was live on AWS

![App Screenshot](https://via.placeholder.com/468x300?text=App+Screenshot+Here)


## 🧠 What I Learned

- Using bucket polciies and ACL's.


## 📌 Future Improvements

- Add SSL using ACM and redirect HTTP to HTTPS.
- Integrate Route 53 to map a custom domain








