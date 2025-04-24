
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

✅ Initializes aws Provider:

![App Screenshot](https://github.com/AvinashSaxena17/terraform-s3-portfolio-hosting/blob/232025fc63ca61da8fe36e6e9e310ce46a335385/s3-images/s3-terraform%20provider.png)


🪣 3. Created a Randomized S3 Bucket & Cofigured Ownership Preferrence:
-  To avoid name collisions and ensure uniqueness:
-  use Variable / name of an unique bucket.
-  Ownership controls were configured to **BucketOwnerPreferred** to retain full control over uploaded objects.

![App Screenshot](https://github.com/AvinashSaxena17/terraform-s3-portfolio-hosting/blob/232025fc63ca61da8fe36e6e9e310ce46a335385/s3-images/s3-bucket-source.png)

🔐 4. Configured Public Access
- Allowed public read access to static files by updating the bucket policy and disabling block public access settings. This made it possible to host and share files like HTML, CSS, and images on the internet.

![App Screenshot](https://github.com/AvinashSaxena17/terraform-s3-portfolio-hosting/blob/232025fc63ca61da8fe36e6e9e310ce46a335385/s3-images/s3-public%20access.png)

![App Screenshot](https://github.com/AvinashSaxena17/terraform-s3-portfolio-hosting/blob/232025fc63ca61da8fe36e6e9e310ce46a335385/s3-images/s3-acl.png)


🌐 5. Enabled Static Website Hosting:

Turned on static website hosting for the S3 bucket by specifying an index and error document. This allowed the bucket to serve web pages directly over the internet.


![App Screenshot](https://github.com/AvinashSaxena17/terraform-s3-portfolio-hosting/blob/232025fc63ca61da8fe36e6e9e310ce46a335385/s3-images/s3-hosting.png)

📤 6. Uploaded All Images, CSS and JS files including index.html and error.hmtl:

![App Screenshot](https://github.com/AvinashSaxena17/terraform-s3-portfolio-hosting/blob/232025fc63ca61da8fe36e6e9e310ce46a335385/s3-images/s3-files-upload.png)


📤 8. Output the Website URL (outputs.tf)

![App Screenshot](https://github.com/AvinashSaxena17/terraform-s3-portfolio-hosting/blob/4e7f2bce9329f375fc6dc2997869e2239b5d2fe8/s3-images/s3-output-1.png)


🧪 Final Result

After running:
```
Terraform init

Terrafor apply -auto-approve
```

Terraform provisioned everything, uploaded my site, and gave me a live URL like:

```
avi-demo-my-bucket.s3-website.ap-south-1.amazonaws.com
```


## 🌍 Output:

![App Screenshot](https://github.com/AvinashSaxena17/terraform-s3-portfolio-hosting/blob/4e7f2bce9329f375fc6dc2997869e2239b5d2fe8/s3-images/s3-output.png))




- 🎉 My portfolio was live hosted on AWS :

![App Screenshot](https://github.com/AvinashSaxena17/terraform-s3-portfolio-hosting/blob/4e7f2bce9329f375fc6dc2997869e2239b5d2fe8/s3-images/s3-url-aws-console.png)


![App Screenshot](https://github.com/AvinashSaxena17/terraform-s3-portfolio-hosting/blob/e885af385e952293434cc35b74f50e617781ac2b/s3-images/s3-webiste-host.png)


## 🧠 What I Learned

- How to use Terraform to automate the provisioning of an S3 bucket with static website hosting enabled.
- Gain hands-on experience with configuring bucket policies, ACLs, and public access settings to securely allow public read access.

## 📌 Future Improvements

- Integrate CloudFront as a CDN to improve performance and enable HTTPS with a custom domain.
- Add monitoring and logging using AWS CloudWatch or S3 access logs to track usage and troubleshoot issues.







