# FOCP

 1. What term is used to describe the ability to identify and allocate costs to the appropriate cost categories in use by a customer?
 
    **Cost Allocation**
 
    In FinOps, the ability to identify and allocate costs to the appropriate cost categories in use by a customer. Ideally direct costs (the cost of resources running in my accounts), amortized costs (the amortization of prepaid costs paid upfront for RIs applied in my accounts), and shared costs (my share of common services accounts run by others on my behalf) can be allocated to individual budgeting categories for a clear view of the entire cost of running my application or workload in the cloud.
    Reference: Please review the terminology page before the exam https://www.finops.org/resources/terminology/ 
 
 2. Each major cloud provider labels the platforms 'allocation metadata' a specific way. How does GCP name the allocation metadata?
    
    **"Labels" and "billing acounts"**
    Explicación
    GCP( Google Cloud Platform)- “labels” and “billing accounts”;
    GCP uses “labels” and “billing accounts”;
    AWS “resource tags”, “Linked Accounts” and “Organizations”;
    Azure “Subscriptions”, “Resource Groups” and “resource tags”
    We do need to know some cloud provider specific terms for the exam.
    Refer here before the exam [FinOps Terminology](https://www.finops.org/resources/terminology/)
  
 3. AWS provides what is called a 'Blended Rate' on its invoices. What is the blended rate showing?
   
    **Shows the effective rate for a group of resources with the same attributes.**

    AWS provides Blended Rate information on its invoice showing the effective rate for a group of resources with the same attributes where some of the resources are receiving a discount from reservations and some are not.

    Terminology is a critical knowledge area for the exam.

 4. Which of the following is NOT part of the FinOps Maturity Model?
   
    **Sprint**

    A “Crawl, Walk, Run” approach to performing FinOps enables organizations to start small, and grow in scale, scope and complexity as business value warrants maturing a functional activity. Taking quick action at a small scale and limited scope allows FinOps teams to assess the outcomes of their actions, and to gain insights into the value of taking further action in a larger, faster, or more granular way.

    Reference: Please review this page before the exam. [FinOps Maturity Model](https://www.finops.org/framework/maturity-model/)

 5. 'Establish FinOps Culture' would be under what domain according to the FinOps Foundation?
    **Organizational Alignment**

    Explanation: There are six specific domains in FinOps according to the FinOps Foundation. We will want to be able to understand what topics are covered by each domain.

    ![domains](images/focp_5.png)

 6. Multiple Selection:(Select two). Which of the following statements would be true regarding deploying Kubernetes clusters concerning cost complexity?
    **Generally organizations have multiple teams consuming portions of those underlying container resources**

    **The average lifespan of a container being one day versus a typically much longer utilization time for a VM**

    Explanation: Managing Kubernetes clusters on just about any cloud platform is very challenging due to the complexity of how Kubernetes is deployed, how resources are consumed and the general lack of real time visibility. Secondly, all providers charge for additional resource usage so for the example the amount of bandwidth or storage API access may not be visible even with tagging.

    Please refer to this page before the exam. [Calculating Container Costs (finops.org)](https://www.finops.org/projects/calculating-container-costs/)

 7. Which of the following is the best definition of a Kubernetes Pod?
    **A pod consists of a group of containers and treats them as a single block of resources that can be scheduled and scaled on the cluster.**

    Explanation: The other answers are incorrect and are variations of the correct answer.

    Reference: Please review the terminology here for containers. [Calculating Container Costs (finops.org)](https://www.finops.org/projects/calculating-container-costs/)

 8. _ _ _ _ _ _ or _ _ _ _ _ _ is the foundation of telling apart workloads in the cloud, identifying ownership, and attributing costs to teams.
    **Tagging or Labeling.**

    Explanation: Tagging or labeling is the foundation of telling apart workloads in the cloud, identifying ownership, and attributing costs to teams. 
    Read more about forecasting. [Accurate Cloud Forecasts (finops.org)](https://www.finops.org/projects/forecasting-cloud-costs/).

 9. Multiple Selection:(Select three)

    Cloud Forecasting can be a challenge, especially in large disparate organizations. Centralization can be a helpful factor but also there are some focus areas that we can use to 'break the challenge into addressable parts'.

    **Tagging and cost allocation can provide insight into resource spending.**

    **Use forecasting models to help provide predicable models for consistency.**
    
    **Use communications to relay that forecasting is being used for decision making**
    
    Explanation: The other answers are incorrect.  For example, we can use both third party and provider tools since some providers may not provide all the reports, features etc. we may want. It is also a Finops best practice to actually centralize our FinOps practice and provide consistency in our reporting/forecasting.
    
    Reference: [https://www.finops.org/projects/accurate-cloud-forecasts/](https://www.finops.org/projects/accurate-cloud-forecasts/)
 
 10. True or False:

    Distributed decision making coupled with the move to variable spending in cloud allows technology teams to efficiently partner with finance and business teams to make informed decisions that drive continual optimization.

    **True**

    Explicación
    Statement is correct. Remember that FinOps is really about collaboration.

    Reference: [FinOps Foundation - What is FinOps?](https://www.finops.org/introduction/what-is-finops/)
