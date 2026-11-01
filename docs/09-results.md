# 09 — Experimental results and engineering assessment

[← Home](../README.md) · [← Android app](08-iot-android.md) · [Next: Reproduction →](10-reproduction.md)

After integrating the radar, display and cloud monitoring stages, we evaluated the prototype by comparing its reported measurements with reference readings. Our capstone presented separate heart-rate and respiratory-rate comparisons for younger and older participants.

## Our measurement setup

According to Chapter 5 of our capstone report, **18 volunteers contributed 90 recorded samples**, with five readings per participant. The younger group contained **10 participants (50 measurements)** aged **22–25**, while the older group contributed **8 participants (40 measurements)** aged **45–79**.

For heart-rate comparison, the book identifies a **Jumper JPD-500D pulse oximeter** as a reference device. The respiratory-rate assessment included manual counting and other instrumentation discussed in the report, including a **24 GHz radar** and **ADS1292R ECG/respiration module**. The references and testing conditions should be considered when interpreting the results; they were not the same as conducting a clinical validation trial.

The project also describes testing under different conditions, such as sitting, rest and after activity. Small radar-measured chest movements are sensitive to target alignment and larger body motion.

## Our reported comparison scores

| Participant group | Heart rate | Respiratory rate |
|---|---:|---:|
| **Ages 22–25** | **92.11%** | **89.88%** |
| **Ages 45–79** | **96.05%** | **93.73%** |

We reported these values as a score calculated from **mean absolute percentage error (MAPE)**:

$$ \operatorname{MAPE}(\%)=\frac{100}{N}\sum_{i=1}^{N}\left|\frac{y_i-\hat{y}_i}{y_i}\right|, $$

$$ \text{Reported score}=100\%-\operatorname{MAPE}(\%). $$

Here $y_i$ is the reference reading and $\hat y_i$ is the radar reading. A high score represents a lower average percentage error in our reported comparisons. It should **not** be interpreted as clinical accuracy, diagnostic sensitivity or specificity. These scores also do not give confidence intervals, agreement limits or an independent measure of robustness.

## Heart-rate evaluation

### Younger volunteers

![Heart-rate comparison for 22–25 age group](../assets/project-images/06-experiments-and-results/heart-rate-young.png)

*Heart-rate comparison chart from the younger group, showing reference and radar readings.*

### Older volunteers

![Heart-rate comparison for 45–79 age group](../assets/project-images/06-experiments-and-results/heart-rate-older.png)

*Heart-rate comparison chart for the older participants.*

## Respiratory-rate evaluation

### Younger volunteers

![Respiratory comparison for 22–25 age group](../assets/project-images/06-experiments-and-results/respiration-young.png)

*Respiratory-rate comparison from the younger group.*

### Older volunteers

![Respiratory comparison for 45–79 age group](../assets/project-images/06-experiments-and-results/respiration-older.png)

*Respiratory-rate comparison for the older participants.*

## What I take from these findings

The comparison figures demonstrated the potential of using a compact radar module for non-contact measurement in our controlled academic setup. Just as importantly, they showed why **measurement conditions, participant movement, sensor positioning and choice of reference instrument** matter.

Our MATLAB plots and experimental graphs answer **different questions**. MATLAB illustrates how an FMCW chirp and IF signal behave in simulation. The experimental graphs compare the physical device's built-in radar readings with reference measurements. One should not be used as evidence for the other's measured performance.

## Boundaries of our study

- The public archive contains the comparison figures and reported aggregate findings, **not** the raw participant-level data.
- The sample size was modest, and the study was not designed to establish clinical diagnostic performance.
- We did not establish validated multi-person monitoring, body-motion compensation, or continuous clinical monitoring.
- The firmware's AMG88xx thermistor reading is not evidence of validated core-body temperature measurement.
- A medical deployment would need a controlled protocol, repeatability testing, agreement analysis, data security, and regulatory review.

These limitations guided how I would extend the research, discussed in [Future work](14-limitations-and-next-steps.md).

[Next: Reproduction and setup →](10-reproduction.md)
